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
	print("Part one of saplingAndBoneMealCheck")
    turtle.select(1)
    itemInHand = turtle.getItemDetail()
	success, blockInFront = turtle.inspect()
	print(itemInHand.name .. " and " blockInFront.name)
    if itemInHand.name == "biomesoplenty:mahogany_sapling" and 
			(not blockInFront.name == "biomesoplenty:mahogany_sapling") then
        turtle.place()
    end
	print("Part one ended")
	print("Part two started")
    turtle.select(2)
    itemInHand = turtle.getItemDetail()
    success, blockInFront = turtle.inspect()
	print(itemInHand.name .. " and " blockInFront.name)
    while blockInFront.name == "biomesoplenty:mahogany_sapling" and 
			itemInHand.name == "minecraft:bone_meal" do
		turtle.select(2)
        turtle.place()
        turtle.select(2)
        itemInHand = turtle.getItemDetail()
		success, blockInFront = turtle.inspect()
    end
	print("Part two ended")
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

-- Full Turn

function fullTurn()
    turtle.turnLeft()
    turtle.turnLeft()
end

--

-- Main Method
while true do
    success, blockInFront = turtle.inspect()
    if blockInFront.name == "biomesoplenty:mahogany_log" then
        digForwardIf()
        turtle.forward()
        -- Goes under the tree

        digTrunk()
        digTreeTop()
		-- Tree chopping

        while not turtle.detectDown() do
            turtle.down()
        end
		-- Returning to base

        fullTurn()
        turtle.forward()
        fullTurn()
		-- Facing original starting position

        saplingAndBoneMealCheck()
		-- Sapling and Bonemeal check
    else if blockInFront.name == "biomesoplenty:mahogany_sapling"
        saplingAndBoneMealCheck()
		-- If sapling, not log, in front, do saplingAndBoneMealCheck
    end
    os.sleep(5)
end

