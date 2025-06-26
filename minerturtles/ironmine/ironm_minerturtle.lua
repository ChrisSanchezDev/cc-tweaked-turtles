-- ironm_minerturtle

-- Dig If's

function digAllIf()
    digUpIf()
    digDownIf()
    digForwardIf()
end

function digUpIf()
    if turtle.detectUp() then
        turtle.digUp()
    end
end

function digDownIf()
    if turtle.detectDown() then
        turtle.digDown()
    end
end

function digForwardIf()
    if turtle.detect() then
        turtle.dig()
    end
end

-- end Dig If's

-- Turns

function fullTurnL()
    turtle.turnLeft()
    turtle.turnLeft()
end

function fullTurnR()
    turtle.turnRight()
    turtle.turnRight()
end

-- end Turns

-- Detections

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

function forwardDetection()
    success, forwardBlock = turtle.inspect()
    if success then
        return forwardBlock.name
    else
        return nil
    end
end

function topDetection()
    success, topBlock = turtle.inspectUp()
    if success then
        return topBlock.name
    else
        return nil
    end
end

function downDetection()
    success, downBlock = turtle.inspectDown()
    if success then
        return downBlock.name
    else
        return nil
    end
end

function leftDetection()
    turtle.turnLeft()
    success, leftBlock = turtle.inspect()
    if success then
        return leftBlock.name
    else 
        return nil
    end
    turtle.turnRight()
end

function rightDetection()
    turtle.turnRight()
    success, rightBlock = turtle.inspect()
    if success then
        return rightBlock.name
    else
        return nil
    end
    turtle.turnLeft()
end

-- end Detections

-- Main Function





-- end Main Function