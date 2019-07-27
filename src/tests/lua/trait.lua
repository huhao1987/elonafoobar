require "tests/lua/support/minctest"

local Trait = Elona.require("Trait")

lrun("test Trait.level", function()
        Testing.start_in_debug_map()
        lequal(Trait.level(9), 0)
        lequal(Trait.level(999), nil)
end)

lrun("test Trait.min", function()
        -- Testing.start_in_debug_map()
        lequal(Trait.min(9), 0)
        lequal(Trait.min(26), -3)
        lequal(Trait.min(999), nil)
end)

lrun("test Trait.max", function()
        -- Testing.start_in_debug_map()
        lequal(Trait.max(9), 3)
        lequal(Trait.max(26), 3)
        lequal(Trait.max(999), nil)
end)

lrun("test Trait.set", function()
        Testing.start_in_debug_map()
        Trait.set(26, 1)
        lequal(Trait.level(26), 1)
        Trait.set(26, -4)
        lequal(Trait.level(26), -3)
        Trait.set(26, 44)
        lequal(Trait.level(26), 3)
        Trait.set(999, 44)
        lequal(Trait.level(999), nil)
end)

lrun("test Trait.modify", function()
        Testing.start_in_debug_map()
        Trait.set(26, 0)
        lequal(Trait.level(26), 0)
        Trait.modify(26, 1)
        lequal(Trait.level(26), 1)
        Trait.modify(26, 1)
        lequal(Trait.level(26), 2)
        Trait.modify(26, 20)
        lequal(Trait.level(26), 3)
        Trait.modify(26, -10)
        lequal(Trait.level(26), -3)
        Trait.modify(999, 44)
        lequal(Trait.level(999), nil)
end)
