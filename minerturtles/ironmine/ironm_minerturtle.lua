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