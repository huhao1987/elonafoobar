#include "input_context.hpp"
#include "../../util/range.hpp"
#include "../audio.hpp"
#include "../config.hpp"
#include "../variables.hpp"
#include "keybind_manager.hpp"
#include "macro_action_queue.hpp"

namespace elona
{

namespace
{

// The last held key has to be global across all input contexts, because a key
// can generate two different actions in different contexts. If key delay
// depended on the last action generated by a keypress, when the context is
// changed by entering a menu, there would be no key delay and the key would be
// counted as pressed twice.

snail::Key last_held_key = snail::Key::none;
int last_held_key_frames = 0;

} // namespace

// This map holds the action categories available in an input context.
// Categories at the top will override categories further down. This is to
// support the behavior of toggling wizard mode.
// TODO: It still needs to support ignoring key conflicts for togglable
// categories.

// clang-format off
static std::map<InputContextType, std::vector<ActionCategory>> input_context_types =
{
    {InputContextType::menu, {ActionCategory::shortcut,
                              ActionCategory::selection,
                              ActionCategory::menu,
                              ActionCategory::default_}},

    {InputContextType::game, {ActionCategory::wizard,
                              ActionCategory::game,
                              ActionCategory::shortcut,
                              ActionCategory::default_}}
};
// clang-format on

bool InputContext::_is_valid_action(const std::string& action_id)
{
    return _available_actions.find(action_id) != _available_actions.end();
}

bool InputContext::_matches(
    const std::string& action_id,
    snail::Key key,
    snail::ModKey modifiers)
{
    if (!_is_valid_action(action_id))
    {
        return false;
    }

    const auto& binding = KeybindManager::instance().binding(action_id);

    if (binding.primary.main == key && binding.primary.modifiers == modifiers)
    {
        return true;
    }
    if (binding.alternate.main == key &&
        binding.alternate.modifiers == modifiers)
    {
        return true;
    }
    if (binding.permanent.main == key &&
        binding.permanent.modifiers == modifiers)
    {
        return true;
    }
    if (binding.joystick == key)
    {
        return true;
    }

    return false;
}

optional<std::string> InputContext::_action_for_key(const Keybind& keybind)
{
    for (const auto& action_id : _available_actions_sorted)
    {
        const auto& binding = KeybindManager::instance().binding(action_id);
        bool excluded = _excluded_categories.find(
                            keybind::actions.at(action_id).category) !=
            _excluded_categories.end();

        if (!excluded && binding.matches(keybind))
        {
            return action_id;
        }
    }

    return none;
}

optional<std::string> InputContext::_check_movement_action(
    const std::set<snail::Key>& keys,
    snail::ModKey modifiers)
{
    StickKey input = StickKey::none;

    // Movement keys have to ignore Shift or Alt. They could be used with them
    // in a hardcoded manner for running or diagonal restriction.
    // TODO: At least make this clear to players somehow.
    snail::ModKey key_modifiers =
        modifiers & ~(snail::ModKey::shift | snail::ModKey::alt);

    for (const auto& key : keys)
    {
        // NOTE: Escape acts as both "summon the quit menu" at the main game
        // loop and "cancel", but actual checks for escape being pressed are
        // relatively few. Setting the global key_escape = true is to avoid
        // having to do (action == "cancel" || action == "escape") everywhere.
        if (_matches("escape", key, key_modifiers))
        {
            bool just_pressed = keywait == 0;
            keywait = 1;
            key_escape = true;

            if (just_pressed)
            {
                return "cancel"s;
            }
            else
            {
                return ""s;
            }
        }

        if (_matches("north", key, key_modifiers))
        {
            input |= StickKey::up;
        }
        else if (_matches("south", key, key_modifiers))
        {
            input |= StickKey::down;
        }
        else if (_matches("east", key, key_modifiers))
        {
            input |= StickKey::left;
        }
        else if (_matches("west", key, key_modifiers))
        {
            input |= StickKey::right;
        }
        else if (_matches("northwest", key, key_modifiers))
        {
            _menu_cycle_key_pressed = true;
            input = StickKey::up | StickKey::left;
        }
        else if (_matches("northeast", key, key_modifiers))
        {
            _menu_cycle_key_pressed = true;
            input = StickKey::up | StickKey::right;
        }
        else if (_matches("southwest", key, key_modifiers))
        {
            input = StickKey::down | StickKey::left;
        }
        else if (_matches("southeast", key, key_modifiers))
        {
            input = StickKey::down | StickKey::right;
        }
        else if (!is_modifier(key))
        {
            // Encountered non-movement key, prioritize it over movement.
            return none;
        }
    }

    if ((modifiers & snail::ModKey::shift) == snail::ModKey::shift)
    {
        // Has to be modified globally, since scroll speed is determined by
        // keybd_wait. See @ref ui_scroll_screen()
        keybd_wait = 100000 + keybd_wait % 100;
        if (keywait == 0)
        {
            keywait = 1;
            return "cancel"s;
        }
    }
    else
    {
        keywait = 0;
    }


    if ((modifiers & snail::ModKey::alt) != snail::ModKey::alt)
    {
        if (input == StickKey::left)
        {
            return "west"s;
        }
        if (input == StickKey::up)
        {
            return "north"s;
        }
        if (input == StickKey::right)
        {
            return "east"s;
        }
        if (input == StickKey::down)
        {
            return "south"s;
        }
    }
    if (input == (StickKey::up | StickKey::left))
    {
        return "northwest"s;
    }
    if (input == (StickKey::up | StickKey::right))
    {
        return "northeast"s;
    }
    if (input == (StickKey::down | StickKey::left))
    {
        return "southwest"s;
    }
    if (input == (StickKey::down | StickKey::right))
    {
        return "southeast"s;
    }

    return none;
}

bool InputContext::_is_nonmovement_key(const snail::Key& k)
{
    return keybind_is_bindable_key(k) || k == snail::Key::enter;
}

optional<Keybind> InputContext::_check_normal_action()
{
    const auto& keys = snail::Input::instance().pressed_keys();
    auto modifiers = snail::Input::instance().modifiers();

    // Pick the first nonmovement key out of the ones that were held.
    // The only actions for which holding multiple keys makes sense is for the
    // movement keys.
    const auto it = range::find_if(
        keys, [this](const snail::Key& k) { return _is_nonmovement_key(k); });

    if (it != keys.end())
    {
        return Keybind(*it, modifiers);
    }

    return none;
}

InputContext InputContext::create(InputContextType type)
{
    InputContext result;

    const auto& categories = input_context_types.at(type);
    for (const auto& category : categories)
    {
        result._add_actions_from_category(category);
    }

    return result;
}

void InputContext::_add_actions_from_category(ActionCategory category)
{
    for (const auto& pair : keybind::actions)
    {
        const auto& action_id = pair.first;
        const auto& action = pair.second;

        if (action.category == category)
        {
            _available_actions.insert(action_id);
            _available_actions_sorted.push_back(action_id);
        }
    }
}

std::string InputContext::_delay_movement_action(
    const std::string& action,
    snail::ModKey modifiers,
    KeyWaitDelay delay_type)
{
    if (keybd_wait >= 100000)
    {
        if ((modifiers & snail::ModKey::shift) != snail::ModKey::shift)
        {
            keybd_wait = 1000 + keybd_wait % 100;
        }
    }

    if (delay_type == KeyWaitDelay::none)
    {
        return action;
    }

    if (delay_type == KeyWaitDelay::walk_run)
    {
        if (keybd_attacking != 0)
        {
            if (keybd_wait % g_config.attack_wait() != 0)
            {
                return ""s;
            }
        }
        else if (!g_config.scroll())
        {
            if (keybd_wait < g_config.walk_wait() * g_config.start_run_wait())
            {
                if (keybd_wait % g_config.walk_wait() != 0)
                {
                    return ""s;
                }
            }
            else
            {
                running = 1;
                if (keybd_wait < 100000)
                {
                    if (keybd_wait % g_config.run_wait() != 0)
                    {
                        return ""s;
                    }
                }
            }
        }
        // else if (input == StickKey::none)
        else if (action == "wait"s)
        {
            if (keybd_wait < 20)
            {
                if (keybd_wait != 0)
                {
                    return ""s;
                }
            }
        }
        else if (keybd_wait > g_config.start_run_wait())
        {
            if (!g_config.scroll_when_run())
            {
                if (keybd_wait % g_config.run_wait() != 0)
                {
                    return ""s;
                }
            }
            running = 1;
        }
    }
    else if (
        keybd_wait < g_config.select_fast_start_wait() * g_config.select_wait())
    {
        if (keybd_wait % g_config.select_wait() != 0)
        {
            return ""s;
        }
    }
    else if (keybd_wait < 1000)
    {
        if (keybd_wait % g_config.select_fast_wait() != 0)
        {
            return ""s;
        }
    }

    return action;
}

static bool
_is_keypress_delayed(int held_frames, int keywait, int initial_keywait)
{
    if (held_frames < initial_keywait)
    {
        if (held_frames == 0)
        {
            return false;
        }
    }
    else if (held_frames % keywait == 0)
    {
        return false;
    }

    return true;
}

bool InputContext::_delay_normal_action(const Keybind& keybind)
{
    if (last_held_key != keybind.main)
    {
        last_held_key_frames = 0;
    }

    bool delayed = _is_keypress_delayed(
        last_held_key_frames,
        g_config.key_repeat_wait(),
        g_config.initial_key_repeat_wait());

    last_held_key_frames++;

    if (last_held_key != keybind.main)
    {
        last_held_key = keybind.main;
    }

    if (delayed)
    {
        return true;
    }

    return false;
} // namespace elona

optional<std::string> InputContext::_handle_macro_action(
    MacroActionQueue& macro_action_queue)
{
    std::string action = "";

    while (action == "" || !_is_valid_action(action))
    {
        if (macro_action_queue.empty())
        {
            return none;
        }

        action = macro_action_queue.pop();
    }

    return action;
}

std::string InputContext::check_for_command(KeyWaitDelay delay_type)
{
    if (!keybind::macro_action_queue.empty())
    {
        if (auto action = _handle_macro_action(keybind::macro_action_queue))
        {
            return *action;
        }
    }

    _menu_cycle_key_pressed = false;
    key_escape = false;

    const auto& keys = snail::Input::instance().pressed_keys();
    auto modifiers = snail::Input::instance().modifiers();

    if (/* !shortcut && */ keyhalt != 0)
    {
        if (keys.size() > 0)
        {
            keybd_wait = 0;
            return "";
        }
        else
        {
            keyhalt = 0;
        }
    }

    if (const auto action = _check_movement_action(keys, modifiers))
    {
        last_held_key = snail::Key::none;
        last_held_key_frames = 0;

        // Movement keys have special key delay behavior, so handle them.
        auto result = _delay_movement_action(*action, modifiers, delay_type);
        ++keybd_wait;

        return result;
    }
    else
    {
        keybd_wait = 0;
        keybd_attacking = 0;
        running = 0;
    }

    if (const auto keybind = _check_normal_action())
    {
        if (const auto action = _action_for_key(*keybind))
        {
            if (!_delay_normal_action(*keybind))
            {
                return *action;
            }
        }
        else
        {
            last_held_key = snail::Key::none;
            last_held_key_frames = 0;
        }
    }
    else
    {
        last_held_key = snail::Key::none;
        last_held_key_frames = 0;
    }

    return ""s;
}

std::string InputContext::check_for_command_with_list(int& list_index)
{
    auto action = check_for_command(KeyWaitDelay::always);

    if (action == "north"s)
    {
        snd("core.cursor1");
        --cs;
        if (cs < 0)
        {
            cs = keyrange - 1;
            if (cs < 0)
            {
                cs = 0;
            }
        }
    }
    if (action == "south"s)
    {
        snd("core.cursor1");
        ++cs;
        if (cs >= keyrange)
        {
            cs = 0;
        }
    }
    if (action == "west"s)
    {
        action = "previous_page"s;
    }
    if (action == "east"s)
    {
        action = "next_page"s;
    }
    if (action == "northwest"s && _menu_cycle_key_pressed)
    {
        action = "previous_menu"s;
    }
    if (action == "northeast"s && _menu_cycle_key_pressed)
    {
        action = "next_menu"s;
    }
    if (cs >= keyrange)
    {
        cs_bk = -1;
        cs = keyrange - 1;
        if (cs < 0)
        {
            cs = 0;
        }
    }
    if (action == "enter"s)
    {
        list_index = cs;
    }
    else if (keybind_action_has_category(action, ActionCategory::selection))
    {
        list_index = keybind_index_number(action);
    }
    else
    {
        list_index = -1;
    }
    return action;
}

void InputContext::reset()
{
    snail::Input::instance().clear_pressed_keys_and_modifiers();
    key_escape = false;
    last_held_key = snail::Key::none;
    last_held_key_frames = 0;
}

InputContext& InputContext::instance()
{
    static optional<InputContext> the_input_context;
    if (!the_input_context)
    {
        the_input_context = create(InputContextType::game);
    }
    return *the_input_context;
}

InputContext& InputContext::for_menu()
{
    static optional<InputContext> the_input_context;
    if (!the_input_context)
    {
        the_input_context = create(InputContextType::menu);
    }
    return *the_input_context;
}

std::unordered_set<ActionCategory> keybind_conflicting_action_categories(
    ActionCategory action_category)
{
    std::unordered_set<ActionCategory> result;
    for (const auto& pair : input_context_types)
    {
        const auto& categories = pair.second;
        bool is_in_context =
            range::find(categories, action_category) != categories.end();

        // If the action can be returned from input in this category, the
        // keybinding for it cannot confict with other actions in other
        // categories for the same input context type.
        if (is_in_context)
        {
            result.insert(categories.begin(), categories.end());
        }
    }
    return result;
}

} // namespace elona
