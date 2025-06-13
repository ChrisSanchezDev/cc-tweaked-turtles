-- TreeTurtle
-- biomesoplenty:mahogany_log
-- Main Tree Cutting Functions
function digTrunk()
    level = 0
    while turtle.detectUp() do
        turtle.digUp()
        turtle.up()
        level = level + 1
    end
end

function digTreeBranch()
    -- [0, 1] Starting Position

    for i = 1, 4 do
        digAllIf()
        turtle.forward()
    end
    -- [4, 1]

    for i = 1, 3 do
        digUpIf()
        turtle.up()
    end
    -- [4, 4]

    fullTurn()

    for i = 1, 4 do
        digAllIf()
        turtle.forward()
    end
    -- [0, 4]

    for i = 1, 3 do
        digDownIf()
        turtle.down()
    end
    -- [0, 1]
end

function digTreeTop()
    for i = 0, 3 do
        digTreeBranch()
        turtle.turnLeft()
    end
end

function saplingAndBoneMealCheck()
    turtle.select(1)
    item = turtle.getItemDetail()
    if item.name == "biomesoplenty:mahogany_sapling" then
        turtle.place()
    end
    turtle.select(2)
    item = turtle.getItemDetail()
    success, itemInFront = turtle.inspect()
    while (not itemInFront == "biomesoplenty:mahogany_log") and item.name == "minecraft:bone_meal" do
            turtle.place()
            turtle.select(2)
            item = turtle.getItemDetail()
    end
end
        
--

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

--

-- Dig If IF WOOD's

-- function digUpIf()
--     if turtle.inspectUp() ==  then
--         turtle.digUp()
--     end
-- end

-- function digDownIf()
--     if turtle.detectDown() then
--         turtle.digDown()
--     end
-- end

-- function digForwardIf()
--     if turtle.detect() then
--         turtle.dig()
--     end
-- end

--

-- Full Turn

function fullTurn()
    turtle.turnLeft()
    turtle.turnLeft()
end

--

-- Main Method
while true do
    success, itemInFront = turtle.inspect()
    if itemInFront.name == "biomesoplenty:mahogany_log" then
        digForwardIf()
        turtle.forward()
        -- Goes under the tree

        digTrunk()
        digTreeTop()

        while not turtle.detectDown() do
            turtle.down()
        end

        fullTurn()
        turtle.forward()
        fullTurn()
        saplingAndBoneMealCheck()
    else
        saplingAndBoneMealCheck()
    end
    os.sleep(5)
end

