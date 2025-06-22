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