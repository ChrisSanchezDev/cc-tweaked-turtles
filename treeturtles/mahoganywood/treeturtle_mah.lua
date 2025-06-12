-- TreeTurtle.v1

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

--Main Method
digForwardIf()
turtle.forward()

digTrunk()
digTreeTop()

while not turtle.detectDown() do
	turtle.down()
end

fullTurn()
turtle.forward()
fullTurn()