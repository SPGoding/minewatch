# world:tick

execute unless score $ worldID matches 1.. run scoreboard players set $ worldID 1
function world:scheduler/tick

function world:components/cake/tick
function world:components/spawn_area/tick
function world:components/spawn_door/tick
execute if score $game custom1 matches 1 run function world:components/target_area/tick
