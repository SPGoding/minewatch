# world:1-bells/tick

# Bells.
## Summon.
execute positioned -830 6 25 run function world:components/cake/summon
execute positioned -900 7 38 run function world:components/cake/summon
execute positioned -970 6 25 run function world:components/cake/summon
execute positioned -932 5 8 run function world:1-bells/components/spring/summon
execute positioned -932 5 42 run function world:1-bells/components/spring/summon
execute positioned -868 5 42 run function world:1-bells/components/spring/summon
execute positioned -868 5 8 run function world:1-bells/components/spring/summon
execute positioned -905 5 3 run function world:components/target_area/summon_negative_point
execute positioned -895 10 9 run function world:components/target_area/summon_positive_point
execute positioned -807 5 17 run function world:components/spawn_area/summon_blue_negative_point
execute positioned -801 12 32 run function world:components/spawn_area/summon_blue_positive_point
execute positioned -999 5 17 run function world:components/spawn_area/summon_red_negative_point
execute positioned -993 12 32 run function world:components/spawn_area/summon_red_positive_point
scoreboard players set rotation params 90
execute positioned -805 5 25 run function world:components/spawn_point/summon_blue
scoreboard players set rotation params 270
execute positioned -995 5 25 run function world:components/spawn_point/summon_red
## Tick.
function world:1-bells/components/spring/tick
