The goal of this MinerTurtle_v1 is to strip mine in a 2 tall x 100 long 
(to start) strip mine.
The idea is that the turtle will be able to identify all blocks to the
below, bottomleft, and bottomright of it one it's first go around on the bottom. 
Then on it's return, it'll scan the top, topleft, and topright blocks.

* We will start with 100 blocks so we don't have to go far if it messes up on
the first tries. Additionally


Things to note:
* Let's start simple, allow it to take a snapshot when it does scan something.
^This snapshot will contain:
    - Strip Mine name
    - Ore name
    - [x, z] cords of spot
    - Location of spot (Top, topleft, topright, bottom, bottomleft, bottomright)
    - newLine
These will all be sent to a main computer which will hold all of it in a txt
file called MM:DD HH:MM MinerTurtle_v1 (#). # is based on the total amount ever
done by that turtle.

It will mine, deposit, refuel itself to get atleast 500 fuel if it contains coal.
(If it doesnt contain enough coal, allow it to retrieve it from a dedicated chest)
(^This chest will also be given coal if there is extra)

Account for possible cave openings. Simply continue forward if it cannot dig
forward (saves fuel)

All Turtles will have a starting position, which will lead to predetermined rows

All possible mines:
    Coal Mine
    Iron Mine
    Gold Mine
    Lapis Mine
    Redstone Mine
    Diamond Mine

All ores will be capable of being picked up (except copper)
    Vanilla ores:
        minecraft:coal_ore
        minecraft:deepslate_coal_ore
        minecraft:iron_ore
        minecraft:deepslate_iron_ore
        --minecraft:copper_ore
        --minecraft:deepslate_copper_ore
        minecraft:gold_ore
        minecraft:deepslate_gold_ore
        minecraft:redstone_ore
        minecraft:deepslate_redstone_ore
        minecraft:lapis_ore
        minecraft:deepslate_lapis_ore
        minecraft:diamond_ore
        minecraft:deepslate_diamond_ore
        minecraft:emerald_ore
        minecraft:deepslate_emerald_ore
        --Nether specific
        --minecraft:nether_quartz_ore
        --minecraft:ancient_debris
    
    Ore drops:
        minecraft:coal
        minecraft:raw_iron
        minecraft:raw_copper
        minecraft:raw_gold
        minecraft:redstone
        minecraft:lapis_lazuli
        minecraft:diamond
        minecraft:emerald
        --Nether specific
        --minecraft:quartz
        --minecraft:ancient_debris

All possible position values:
    bottom
    bottomleft
    bottomright

    bottomforward
    topforward

    top
    topleft
    topright
    
    

CHRONOLOGICAL ORDER:
-- SETUP PHASE
-   Hello World!

-   Turtle is given a start command from a computer or interaction. A file will
    allow the turtle to continue unless given a return statment to return back
    to starting point.

-   The turtle(s) will boot in sequential order. The start commands for every
    turtle should be about 15 seconds apart.

-   The turtle boots up.

-   It checks its fuel amount.
    If less than 500, check inventory for coal and refuel until 500<=. If it
    needs to refuel but it does not have enough coal, check the inventory.
    If the inventory contains anything, deposit everything except ore items in
    a stoneish chest. Then drop all ores (assuming there's no coal left) in the
    ore container and then go to the coal chest.
    If nothing in inventory, go straight to coal chest. At coal chest, take 1
    at a time and then refuel. Continue this until 500<=.
    
-   If the coal chest is empty and the turtle does not have enough fuel, it will
    prematurely end the program and it will go back to it's starting position.
    
-   If stuck, detect if another turtle is in front of it. If so, have it rise or 
    lower (based on if there is space above, or below). A random interval will
    determine who goes first (either 5, 10, or 15 seconds of waiting).

-   Have the turtle enter it's designated left or right row. Once it does, have it
    go all the way down till it hits a wall, then have it turn left/right to
    check if the wall is empty, if so, turn back to original direction and dig
    5 blocks away from the opening.

-   The turtle will send a GPS cord to MinePC for proper return arrivals.

-- MINING PHASE
-   The turtle will turn towards the wall and begin mining 100 blocks down.

-   As the turtle mines on the bottom level first. It first checks the block in
    front of it, if there is a block, mine it and then move forward.
    From here, scan bottom, bottomleft, bottomright. Then repeat till 100 blocks
    are completed.

-   If at any point, bottom, bottomleft, or bottomright detects an ore, send a 
    log back to the main computer, which will then store these logs into a single
    file holding all the logs of that entire mining session in this format:
    MM:DD HH:MM MinerTurtle_v1 (#)
    The log itself will have this format:

    Header: [Mine: typeOfMine]

    [Log: #]
    [Ore: oreTypeFound]
    [Location: x, z]
    [Position: bottom/bottomleft/etc.]
    /newLine
    [Log: #]
    [Ore: oreTypeFound]
    [Location: x, z]
    [Position: bottom/bottomleft/etc.]

*   If there is an open block forward (likely meaning a cave entrance), have the
    turtle skip the dig and move forward to preserve fuel. Still continue scans.

-   Once 100 blocks have been reached. Scan all normal directions and forward.
    Rise up one, scan all normal directions (except bottom) and forward. Full turn

-   Repeat the process of mining 100 blocks back. This time, scan for top,
    topleft, and topright. Continue to 100 and then have the robot look for the
    original opening GPS cord.

-- RETRIVAL PHASE
-   The turtle will now move towards the outside of it's row and begin moving
    towards three types of chests. The bottom one will contain stonish blocks, 
    top will contain ores (except coal), and ones moved away will

-   It will first move to the bottom chest and deposit all blocks except those
    that are ores of any kind.

-   It will then move up to the top chest to drop of all ores except coal.

-   It will then move up to the coal chest. Before depositing, it will refuel
    itself until 500<=. If full, deposit all remaining coal and return to starting
    position. If it runs out, it will check the coal chest for more coal. If 
    there is no coal in that chest either, it will return to it's starting 
    position and print a no-coal message. 

-   Fin!