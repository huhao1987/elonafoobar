#include "../lua_env/lua_env.hpp"
#include "../talk.hpp"
#include "../ui/ui_menu_dialog.hpp"
#include "../variables.hpp"

namespace elona
{

static void _dialog_error(const std::string& node_id, const std::string& text)
{
    txtef(color_index_t::red);
    txt(node_id + ": Dialog error: " + text);
}

bool dialog_node_behavior_generator::apply(
    dialog_data&,
    dialog_node& the_dialog_node)
{
    sol::table result = lua::lua->get_export_manager().call_with_result(
        callback_generator, sol::lua_nil);

    if (result == sol::lua_nil)
    {
        _dialog_error(
            the_dialog_node.id,
            callback_generator + ": Returned value was nil.");
        return false;
    }

    // Expects a Lua table of this format.
    // {
    //   text = {"id.1", "id.2", "id.3"},
    //   choices = {
    //     {text = "id.1", node = "core.dialog:dialog.node1},
    //     {text = "id.2", node = "core.dialog:dialog.node2},
    //   }
    // }

    the_dialog_node.text.clear();
    sol::table result_text = result["text"];
    for (const auto& pair : result_text)
    {
        std::string text = pair.second.as<std::string>();
        the_dialog_node.text.emplace_back(text);
    }

    the_dialog_node.choices.clear();
    sol::table result_choices = result["choices"];
    for (const auto& pair : result_choices)
    {
        sol::table choice_data = pair.second.as<sol::table>();
        std::string locale_key = choice_data["locale_key"];
        sol::optional<std::string> node_id_opt = choice_data["node_id"];
        optional<std::string> node_id;

        if (node_id_opt)
        {
            node_id = *node_id_opt;
        }
        else
        {
            node_id = none;
        }

        the_dialog_node.choices.emplace_back(locale_key, node_id);
    }

    return true;
}

bool dialog_node_behavior_redirector::apply(
    dialog_data& the_dialog,
    dialog_node& the_dialog_node)
{
    sol::object result = lua::lua->get_export_manager().call_with_result(
        callback_redirector, sol::lua_nil);

    if (result == sol::lua_nil || !result.is<std::string>())
    {
        _dialog_error(
            the_dialog_node.id,
            callback_redirector
                + ": Redirector callback returned invalid node id");
        return false;
    }

    return the_dialog.set_node(result.as<std::string>());
}

bool dialog_node_behavior_inherit_choices::apply(
    dialog_data& the_dialog,
    dialog_node& the_dialog_node)
{
    if (is_applying)
    {
        _dialog_error(
            the_dialog_node.id,
            "Cannot inherit dialog choices from other inherit nodes "
            "cyclically.");
        is_applying = false;
        return false;
    }

    is_applying = true;
    auto choices = the_dialog.choices_for_node(node_id_for_choices);
    is_applying = false;

    if (choices)
    {
        the_dialog_node.choices = *choices;
        return true;
    }
    else
    {
        _dialog_error(
            the_dialog_node.id,
            "Cannot obtain choices for node " + node_id_for_choices);
        return false;
    }
}


bool dialog_data::has_more_text()
{
    if (!current_node_id)
    {
        return false;
    }

    return true;
}

bool dialog_data::state_is_valid()
{
    const auto it = nodes.find(*current_node_id);
    if (it == nodes.end())
    {
        _dialog_error(*current_node_id, "No such dialog node");
        return false;
    }

    const auto& node = it->second;
    size_t text_amount = node.text.size();

    if (text_amount == 0)
    {
        _dialog_error(*current_node_id, "No text was found in dialog node");
        return false;
    }

    if (current_text_index > text_amount)
    {
        throw std::runtime_error(
            *current_node_id + ": BUG: Dialog has " + text_amount
            + " texts, but " + current_text_index + " was requested");

        return false;
    }

    if (node.choices.size() == 0)
    {
        _dialog_error(*current_node_id, "No choices were found in dialog node");
        return false;
    }

    return true;
}

bool dialog_data::is_cancelable_now()
{
    return false;
}

static bool _run_callback(optional<std::string>& callback)
{
    try
    {
        if (callback)
        {
            lua::lua->get_export_manager().call_unsafely(*callback);
        }
        return true;
    }
    catch (...)
    {
        return false;
    }
}

bool dialog_data::run_callback_before()
{
    return _run_callback(current_node().callback_before);
}

bool dialog_data::run_callback_after()
{
    return _run_callback(current_node().callback_after);
}

bool dialog_data::apply_node_behavior(dialog_node& node)
{
    try
    {
        return node.behavior.apply(*this, node);
    }
    catch (const std::exception& e)
    {
        _dialog_error(node.id, e.what());
        return false;
    }
}

bool dialog_data::advance(size_t choice_index)
{
    if (!choices())
    {
        if (choice_index != 0)
        {
            _dialog_error(
                *current_node_id,
                "Current node should have \"more\" choice only, but choice "s
                    + choice_index + " was requested"s);
            return false;
        }

        return advance_internal(node_id(), current_text_index + 1);
    }

    size_t choice_amount = choices()->size();
    if (choice_index >= choice_amount)
    {
        _dialog_error(
            *current_node_id,
            "Current node has "s + choice_amount + " choices, but "s
                + choice_index + " was requested"s);
        return false;
    }

    const auto& choice = choices()->at(choice_index);
    return set_node(choice.node_id);
}

bool dialog_data::set_node(optional<std::string> node_id)
{
    return advance_internal(node_id, 0);
}

optional<const std::vector<dialog_choice>&> dialog_data::choices_for_node(
    const std::string& node_id)
{
    auto it = nodes.find(node_id);
    if (it == nodes.end())
    {
        _dialog_error(*current_node_id, "No such node " + node_id);
        return none;
    }

    if (!apply_node_behavior(it->second))
    {
        return none;
    }

    return it->second.choices;
}

bool dialog_data::advance_internal(
    optional<std::string> node_id,
    size_t text_index)
{
    if (!node_id)
    {
        current_node_id = none;
        current_text_index = 0;
        return true;
    }

    auto it = nodes.find(*node_id);
    if (it == nodes.end())
    {
        _dialog_error(*current_node_id, "No such node " + *node_id);
        return false;
    }

    if (!apply_node_behavior(it->second))
    {
        return false;
    }

    current_node_id = *node_id;
    current_text_index = text_index;

    if (!state_is_valid())
    {
        return false;
    }

    return true;
}

void dialog_data::show()
{
    set_node(starting_node);

    if (!state_is_valid())
    {
        return;
    }

    while (!has_more_text())
    {
        if (!run_callback_before())
        {
            return;
        }

        bool cancelable = is_cancelable_now();
        auto result = ui::ui_menu_dialog(*this, cancelable).show();

        if (result.canceled)
        {
            if (scenemode)
            {
                scene_cut = 1;
            }
            talk_reset_variables();
            // return talk_result_t::talk_end;
            return;
        }

        if (!run_callback_after())
        {
            return;
        }

        size_t choice_index = *result.value;
        if (!advance(choice_index))
        {
            return;
        }
    }
}

} // namespace elona
