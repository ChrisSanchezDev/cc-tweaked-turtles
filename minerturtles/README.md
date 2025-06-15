## Miner Turtle

### All possible mines:
    - Coal Mine
    - Iron Mine
    - Gold Mine
    - Lapis Mine
    - Redstone Mine
    - Diamond Mine

### All possible ores:

| Ore Type              | Normal ID                     | Deepslate ID                      | Drop ID                   |
|-----------------------|-------------------------------|-----------------------------------|---------------------------|
| Coal                  | minecraft:coal_ore            | minecraft:deepslate_coal_ore      | minecraft:coal            |
| Iron                  | minecraft:iron_ore            | minecraft:deepslate_iron_ore      | minecraft:raw_iron        |
| Copper                | minecraft:copper_ore          | minecraft:deepslate_copper_ore    | minecraft:raw_copper      |
| Gold                  | minecraft:gold_ore            | minecraft:deepslate_gold_ore      | minecraft:raw_gold        |
| Redstone              | minecraft:redstone_ore        | minecraft:deepslate_redstone_ore  | minecraft:redstone        |
| Lapis                 | minecraft:lapis_ore           | minecraft:deepslate_lapis_ore     | minecraft:lapis_lazuli    |
| Diamond               | minecraft:diamond_ore         | minecraft:deepslate_diamond_ore   | minecraft:diamond         |
| Emerald               | minecraft:emerald_ore         | minecraft:deepslate_emerald_ore   | minecraft:emerald         |
| (N) Gold Nuggets      | minecraft:nether_gold_ore     |                                   | minecraft:gold_nugget     |
| (N) Quartz            | minecraft:nether_quartz_ore   |                                   | minecraft:quartz          |
| (N) Ancient Debris    | minecraft:ancient_debris      |                                   | minecraft:ancient_debris  |
| Silver                | iceandfire:silver_ore         |                                   | iceandfire:silver_ore     |
| Zinc                  | create:zinc_ore               | create:deepslate_zinc_ore         | create:raw_zinc           |


### All possible position values:
| Top or Bottom Block   | Position Name     |
|-----------------------|-------------------|
| Bottom                | bottom            |
|                       | bottomleft        |
|                       | bottomright       |
|                       | bottomforward     |
| Top                   | top               |
|                       | topleft           |
|                       | topright          |
|                       | topforward        |
    


## Procedures:
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

-   Goodbye World!



### Possible Improvements:

-   Ability to mine ore veins itself (properly scanning all possible areas ores
    can be in) and then returning to it's original position.

-   Automatic Smelting

-   Automatic Blockifying Complete ores

-   Turtle dedicated solely for coal distribution to multiple machinery
