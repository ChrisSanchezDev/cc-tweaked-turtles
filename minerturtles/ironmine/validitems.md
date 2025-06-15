-- All possible ores
--     | Ore Type              | Normal ID                     | Deepslate ID                      | Drop ID                   |
--     |-----------------------|-------------------------------|-----------------------------------|---------------------------|
--     | Coal                  | minecraft:coal_ore            | minecraft:deepslate_coal_ore      | minecraft:coal            |
--     | Iron                  | minecraft:iron_ore            | minecraft:deepslate_iron_ore      | minecraft:raw_iron        |
--     | Copper                | minecraft:copper_ore          | minecraft:deepslate_copper_ore    | minecraft:raw_copper      |
--     | Gold                  | minecraft:gold_ore            | minecraft:deepslate_gold_ore      | minecraft:raw_gold        |
--     | Redstone              | minecraft:redstone_ore        | minecraft:deepslate_redstone_ore  | minecraft:redstone        |
--     | Lapis                 | minecraft:lapis_ore           | minecraft:deepslate_lapis_ore     | minecraft:lapis_lazuli    |
--     | Diamond               | minecraft:diamond_ore         | minecraft:deepslate_diamond_ore   | minecraft:diamond         |
--     | Emerald               | minecraft:emerald_ore         | minecraft:deepslate_emerald_ore   | minecraft:emerald         |
--     | (N) Gold Nuggets      | minecraft:nether_gold_ore     |                                   | minecraft:gold_nugget     |
--     | (N) Quartz            | minecraft:nether_quartz_ore   |                                   | minecraft:quartz          |
--     | (N) Ancient Debris    | minecraft:ancient_debris      |                                   | minecraft:ancient_debris  |
--     | Silver                | iceandfire:silver_ore         |                                   | iceandfire:silver_ore     |
--     | Zinc                  | create:zinc_ore               | create:deepslate_zinc_ore         | create:raw_zinc           |



validScannableOres = {
    ["minecraft:coal_ore"] = true,
    ["minecraft:deepslate_coal_ore"] = true,
    ["minecraft:iron_ore"] = true,
    ["minecraft:deepslate_iron_ore"] = true,
    ["minecraft:gold_ore"] = true,
    ["minecraft:deepslate_gold_ore"] = true,
    ["minecraft:redstone_ore"] = true,
    ["minecraft:deepslate_redstone_ore"] = true,
    ["minecraft:lapis_ore"] = true,
    ["minecraft:deepslate_lapis_ore"] = true,
    ["minecraft:diamond_ore"] = true,
    ["minecraft:deepslate_diamond_ore"] = true,
    ["minecraft:emerald_ore"] = true,
    ["minecraft:deepslate_emerald_ore"] = true,
    ["iceandfire:silver_ore"] = true,
    ["create:zinc_ore"] = true,
    ["create:deepslate_zinc_ore"] = true
}

minecraft:coal

oresToStore = {
    ["minecraft:raw_iron"] = true,
    ["minecraft:raw_copper"] = true,
    ["minecraft:raw_gold"] = true,
    ["minecraft:redstone"] = true,
    ["minecraft:lapis_lazuli"] = true,
    ["minecraft:diamond"] = true,
    ["minecraft:emerald"] = true,
    ["iceandfire:silver_ore"] = true,
    ["create:raw_zinc"] = true
}


validFuelItems = {
	["minecraft:coal"] = true,
	["minecraft:charcoal"] = true,
    ["biomesoplenty:mahogany_log"] = true,
    ["biomesoplenty:umbran_log"] = true
}

