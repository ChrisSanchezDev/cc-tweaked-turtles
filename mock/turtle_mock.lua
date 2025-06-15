-- turtle_mock.lua
-- Full mock of the ComputerCraft/CC:Tweaked Turtle API for syntax checking and 
-- testing in VS Code

-- Movement
function turtle.up() end
function turtle.down() end
function turtle.forward() end
function turtle.back() end
function turtle.turnLeft() end
function turtle.turnRight() end

-- Digging and placing
function turtle.dig() end
function turtle.digUp() end
function turtle.digDown() end
function turtle.place() end
function turtle.placeUp() end
function turtle.placeDown() end

-- Sucking and dropping
function turtle.suck() end
function turtle.suckUp() end
function turtle.suckDown() end
function turtle.drop() end
function turtle.dropUp() end
function turtle.dropDown() end

-- Inventory
function turtle.select(slot) end
function turtle.getItemCount(slot) return 64 end
function turtle.getItemSpace(slot) return 64 end
function turtle.compareTo(slot) return true end
function turtle.transferTo(slot, count) end
function turtle.getItemDetail(slot, detailed) 
    return { name = "minecraft:stone", count = 1 } end

-- Comparing
function turtle.compare() return true end
function turtle.compareUp() return true end
function turtle.compareDown() return true end

-- Fuel
function turtle.refuel(amount) end
function turtle.getFuelLevel() return 1000 end
function turtle.getFuelLimit() return 20000 end

-- Detection
function turtle.detect() return false end
function turtle.detectUp() return false end
function turtle.detectDown() return false end

-- Inspecting
function turtle.inspect() return true, { name = "minecraft:stone" } end
function turtle.inspectUp() return true, { name = "minecraft:dirt" } end
function turtle.inspectDown() return true, { name = "minecraft:grass_block" } end

-- Attacking
function turtle.attack() return true end
function turtle.attackUp() return true end
function turtle.attackDown() return true end

-- Sensing
function turtle.getSelectedSlot() return 1 end
function turtle.getFuelLevel() return 1000 end
function turtle.getFuelLimit() return 20000 end

-- Crafting
function turtle.craft(limit) end