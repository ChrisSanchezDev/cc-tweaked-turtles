-- treeturtle_umb_s.lua

-- biomesoplenty:umbran_log
-- biomesoplenty:umbran_sapling
-- biomesoplenty:umbran_leaves

-- package.path = "../../mock?.lua;" .. package.path
-- require("turtle_mock")
-- TODO: Comment before starting code in-game

-- Main Tree Cutting Functions

function digTrunk(level)
    while turtle.detectUp() do
        turtle.digUp()
        turtle.up()
        level = level + 1
    end
    return level
end

function digTreeBranch()
    -- [2, 2]
    -- [ ][ ][ ]
    -- [ ][^][ ]
    -- [ ][ ][ ]
    digForwardIf()
    turtle.forward()
    -- [2, 3]
    -- [ ][^][ ]
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    turtle.turnLeft()
    digForwardIf()
    turtle.forward()
    -- 1, 3
    -- [<][ ][ ]
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    turtle.turnLeft()
    digForwardIf()
    turtle.forward()
    -- 1, 2
    -- [ ][ ][ ]
    -- [v][ ][ ]
    -- [ ][ ][ ]
    digForwardIf()
    turtle.forward()
    -- 1, 1
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    -- [v][ ][ ]
    turtle.turnLeft()
    digForwardIf()
    turtle.forward()
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    -- [ ][>][ ]
    digForwardIf()
    turtle.forward()
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    -- [ ][ ][>]
    turtle.turnLeft()
    digForwardIf()
    turtle.forward()
    -- [ ][ ][ ]
    -- [ ][ ][^]
    -- [ ][ ][ ]
    digForwardIf()
    turtle.forward()
    -- [ ][ ][^]
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    turtle.turnLeft()
    digForwardIf()
    turtle.forward()
    -- [ ][<][ ]
    -- [ ][ ][ ]
    -- [ ][ ][ ]
    turtle.turnLeft()
    digForwardIf()
    turtle.forward()
    -- [ ][ ][ ]
    -- [ ][v][ ]
    -- [ ][ ][ ]
    fullTurn()
    -- [ ][ ][ ]
    -- [ ][^][ ]
    -- [ ][ ][ ]
end

function digTreeTop(level)
    -- Goal: Dig a 1 tall, 4 deep, 3 wide, block from the top of the tree. This
    -- allows for collection of saplings.
    -- If level is greater than 5, incase it's an extra large tree, keep doing 
    -- the 3x3 until reaching 4 above the bottom
    digUpIf()
    turtle.up()
    digTreeBranch()
    if level < 5 then
        for i = 0, 3 do
            digDownIf()
            turtle.down()
            digTreeBranch()
        end
    else 
        for i = 0, (level - 4) do
            digDownIf()
            turtle.down()
            digTreeBranch()
        end
    end
end

-- end Main Tree Cutting Functions

-- Turtle Checks

function saplingAndBoneMealCheck()
	print("Beginning: saplingAndBoneMealCheck")
    turtle.select(1)
    itemInHand = turtle.getItemDetail()
	success, blockInFront = turtle.inspect()
	if itemInHand and success then
		print("Item: " .. tostring(itemInHand.name) .. " and Block: " .. 
                tostring(blockInFront.name))
	elseif itemInHand then
		print("Item: " .. tostring(itemInHand.name))
	elseif success then
		print("Block: " .. tostring(blockInFront.name))
	end
    if itemInHand and itemInHand.name == "biomesoplenty:umbran_sapling" and 
			(not success) then
        turtle.place()
    end
    turtle.select(2)
    itemInHand = turtle.getItemDetail()
    success, blockInFront = turtle.inspect()
	if itemInHand and success then
		print("Item: " .. tostring(itemInHand.name) .. " and Block: " .. 
                tostring(blockInFront.name))
	elseif itemInHand then
		print("Item: " .. tostring(itemInHand.name))
	elseif success then
		print("Block: " .. tostring(blockInFront.name))
	end
    while itemInHand and itemInHand.name == "minecraft:bone_meal" and success and
			blockInFront.name == "biomesoplenty:umbran_sapling" do
        print("Using Bonemeal")
		turtle.select(2)
        turtle.place()
        turtle.select(2)
        itemInHand = turtle.getItemDetail()
		success, blockInFront = turtle.inspect()
    end
	print("Ending: saplingAndBoneMealCheck")
end

function refuelingOptions()
	print("Beginning: refuelingOptions")
	validFuelItems = {
        ["minecraft:coal"] = true,
        ["minecraft:charcoal"] = true,
        ["biomesoplenty:mahogany_log"] = true,
        ["biomesoplenty:umbran_log"] = true
    }
	for i = 1, 16 do
		turtle.select(i)
		itemInHand = turtle.getItemDetail()
		while itemInHand and validFuelItems[itemInHand.name] and 
                turtle.getFuelLevel() < 100 do
			print("Refueling from: "..itemInHand.name)
			turtle.refuel()
			turtle.select(i)
			itemInHand = turtle.getItemDetail()
		end
	end
	if turtle.getFuelLevel() < 100 then
		print("Not enough fuel!")
		print("Ending: refuelingOptions")
		return false
	end
	print("Ending: refuelingOptions")
	return true
end

-- end Turtle Checks

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

-- Full Turn

function fullTurn()
    turtle.turnLeft()
    turtle.turnLeft()
end

-- end Full Turn

-- Main Method
unbreakableBlocks = {
    ["minecraft:dirt"] = true,
    ["minecraft:rooted_dirt"] = true,
    ["minecraft:podzol"] = true,
    ["minecraft:grass_block"] = true,
    ["minecraft:stone"] = true,
    ["minecraft:andesite"] = true,
    ["minecraft:diorite"] = true,
    ["minecraft:granite"] = true,
    ["minecraft:tuff"] = true
}

while true do
	if not refuelingOptions() then
		break
	end
    success, blockInFront = turtle.inspect()
    if success and blockInFront.name == "biomesoplenty:umbran_log" then
        digForwardIf()
        turtle.forward()
        -- Goes under the tree

        level = 0
        digTrunk(level)
        digTreeTop(level)
		-- Tree chopping

        success, blockInFront = turtle.inspect()
        while (not unbreakableBlocks[blockInFront]) do
            if not success then
                turtle.down()
            else
                digDownIf()
                turtle.down()
            end
            success, blockInFront = turtle.inspect()
        end
		-- Returning to base

        fullTurn()
        turtle.forward()
        fullTurn()
		-- Facing original starting position

        saplingAndBoneMealCheck()
		-- Sapling and Bonemeal check
    elseif (not success) or blockInFront.name == "biomesoplenty:umbran_sapling" then
        saplingAndBoneMealCheck()
		-- If sapling, not log, in front, do saplingAndBoneMealCheck
    end
    os.sleep(5)
end
print("Powering down")