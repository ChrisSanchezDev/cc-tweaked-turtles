-- TreeTurtle

-- biomesoplenty:mahogany_log
-- biomesoplenty:mahogany_sapling
-- biomesoplenty:mahogany_leaves

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
	print("Beginning: saplingAndBoneMealCheck")
    turtle.select(1)
    itemInHand = turtle.getItemDetail()
	success, blockInFront = turtle.inspect()
	if itemInHand and success then
		print(tostring(itemInHand.name) .. " and " .. tostring(blockInFront.name))
	elseif itemInHand then
		print(tostring(itemInHand.name))
	elseif success then
		print(tostring(blockInFront.name))
	end
    if itemInHand and itemInHand.name == "biomesoplenty:mahogany_sapling" and 
			(not success) then
        turtle.place()
    end
    turtle.select(2)
    itemInHand = turtle.getItemDetail()
    success, blockInFront = turtle.inspect()
	if itemInHand and success then
		print(tostring(itemInHand.name) .. " and " .. tostring(blockInFront.name))
	elseif itemInHand then
		print(tostring(itemInHand.name))
	elseif success then
		print(tostring(blockInFront.name))
	end
    while itemInHand and itemInHand.name == "minecraft:bone_meal" and success and
			blockInFront.name == "biomesoplenty:mahogany_sapling" do
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
		["biomesoplenty:mahogany_log"] = true,
		["minecraft:coal"] = true,
		["minecraft:charcoal"] = true
	}
	for i = 1, 16 do
		turtle.select(i)
		itemInHand = turtle.getItemDetail()
		while itemInHand and validFuelItems[itemInHand.name] and turtle.getFuelLevel() < 100 do
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
	if not refuelingOptions() then
		break
	end
    success, blockInFront = turtle.inspect()
    if success and blockInFront.name == "biomesoplenty:mahogany_log" then
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
    elseif blockInFront.name == "biomesoplenty:mahogany_sapling" or 
			success == false then
        saplingAndBoneMealCheck()
		-- If sapling, not log, in front, do saplingAndBoneMealCheck
    end
    os.sleep(5)
end
print("Powering down")