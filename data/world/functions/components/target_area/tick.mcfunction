# world:components/target_area/tick

# Get players in target area.
execute store result score xMin params run data get entity @e[type=minecraft:area_effect_cloud,limit=1,tag=world_target_area_negative_point_component] Pos[0] 10
execute store result score yMin params run data get entity @e[type=minecraft:area_effect_cloud,limit=1,tag=world_target_area_negative_point_component] Pos[1] 10
execute store result score zMin params run data get entity @e[type=minecraft:area_effect_cloud,limit=1,tag=world_target_area_negative_point_component] Pos[2] 10
execute store result score xMax params run data get entity @e[type=minecraft:area_effect_cloud,limit=1,tag=world_target_area_positive_point_component] Pos[0] 10
execute store result score yMax params run data get entity @e[type=minecraft:area_effect_cloud,limit=1,tag=world_target_area_positive_point_component] Pos[1] 10
execute store result score zMax params run data get entity @e[type=minecraft:area_effect_cloud,limit=1,tag=world_target_area_positive_point_component] Pos[2] 10

scoreboard players remove xMin params 5
scoreboard players add xMax params 5

scoreboard players remove yMax params 18

scoreboard players remove zMin params 5
scoreboard players add zMax params 5

execute as @e[tag=player,tag=!died] run function world:components/target_area/tick_as

# Handle process.
# $blueTeam custom1 The process of blue team.
## max: 2600
# $redTeam custom1 The process of red team.
## max: 2600
# $targetArea custom1 The area process.
## max: 600
# $targetArea custom2 The current overtime.
## max: 40
# $targetArea custom3 The state of the target area.
## 0 - locked to open
## 1 - open
## 2 - open to blue
## 3 - open to red
## 4 - blue
## 5 - blue to red
## 6 - red
## 7 - red to blue
scoreboard players set $maxAreaProcess tmp 2600
scoreboard players operation $maxAreaProcessMinusOne tmp = $maxAreaProcess tmp
scoreboard players remove $maxAreaProcessMinusOne tmp 1

bossbar set .mw:process players @a
scoreboard players add $blueTeam custom1 0
scoreboard players add $redTeam custom1 0
scoreboard players add $targetArea custom1 0
scoreboard players add $targetArea custom2 0
scoreboard players add $targetArea custom3 0
## Get player count.
execute store result score blueCount tmp if entity @e[tag=in_target_area,tag=blue_team,tag=!died]
execute store result score redCount tmp if entity @e[tag=in_target_area,tag=red_team,tag=!died]
## Switch states.
### 0 -> 1
execute if score $targetArea custom3 matches 0 if score $targetArea custom1 matches ..599 run scoreboard players add $targetArea custom1 1
execute if score $targetArea custom3 matches 0 if score $targetArea custom1 matches 600.. run function world:components/target_area/switch_to_state_1
### 1 -> 2
execute if score $targetArea custom3 matches 1 if score blueCount tmp matches 1.. if score redCount tmp matches 0 run scoreboard players set $targetArea custom3 2
### 1 -> 3
execute if score $targetArea custom3 matches 1 if score blueCount tmp matches 0 if score redCount tmp matches 1.. run scoreboard players set $targetArea custom3 3
### 2 -> 1
execute if score $targetArea custom3 matches 2 if score $targetArea custom1 matches ..0 if score blueCount tmp matches 0 run scoreboard players set $targetArea custom3 1
### 2 -> 4
execute if score $targetArea custom3 matches 2 if score $targetArea custom1 matches 600.. run function world:components/target_area/switch_to_state_4
### 3 -> 1
execute if score $targetArea custom3 matches 3 if score $targetArea custom1 matches ..0 if score redCount tmp matches 0 run scoreboard players set $targetArea custom3 1
### 3 -> 6
execute if score $targetArea custom3 matches 3 if score $targetArea custom1 matches 600.. run function world:components/target_area/switch_to_state_6
### 4 -> 5
execute if score $targetArea custom3 matches 4 if score blueCount tmp matches 0 if score redCount tmp matches 1.. run scoreboard players set $targetArea custom3 5
### 5 -> 4
execute if score $targetArea custom3 matches 5 if score $targetArea custom1 matches ..0 if score redCount tmp matches 0 run scoreboard players set $targetArea custom3 4
### 5 -> 6
execute if score $targetArea custom3 matches 5 if score $targetArea custom1 matches 600.. run scoreboard players set $targetArea custom2 0
execute if score $targetArea custom3 matches 5 if score $targetArea custom1 matches 600.. run function world:components/target_area/switch_to_state_6
### 6 -> 7
execute if score $targetArea custom3 matches 6 if score blueCount tmp matches 1.. if score redCount tmp matches 0 run scoreboard players set $targetArea custom3 7
### 7 -> 4
execute if score $targetArea custom3 matches 7 if score $targetArea custom1 matches 600.. run scoreboard players set $targetArea custom2 0
execute if score $targetArea custom3 matches 7 if score $targetArea custom1 matches 600.. run function world:components/target_area/switch_to_state_4
### 7 -> 6
execute if score $targetArea custom3 matches 7 if score $targetArea custom1 matches ..0 if score blueCount tmp matches 0 run scoreboard players set $targetArea custom3 6
## Set bossbar's... 
### ...color according to the state.
execute if score $targetArea custom3 matches 0 run bossbar set .mw:process name {"translate": "world.target_area.locked", "color": "yellow"}
execute if score $targetArea custom3 matches 0..1 run bossbar set .mw:process color yellow
execute if score $targetArea custom3 matches 2 run bossbar set .mw:process color blue
execute if score $targetArea custom3 matches 3 run bossbar set .mw:process color red
execute if score $targetArea custom3 matches 4 run bossbar set .mw:process color blue
execute if score $targetArea custom3 matches 5..6 run bossbar set .mw:process color red
execute if score $targetArea custom3 matches 7 run bossbar set .mw:process color blue
### ...name according to the team process.
execute if score $targetArea custom3 matches 1.. run scoreboard players operation blueTeamPercents tmp = $blueTeam custom1
execute if score $targetArea custom3 matches 1.. run scoreboard players operation blueTeamPercents tmp *= 100 const
execute if score $targetArea custom3 matches 1.. run scoreboard players operation blueTeamPercents tmp /= 2600 const
execute if score $targetArea custom3 matches 1.. run scoreboard players operation redTeamPercents tmp = $redTeam custom1
execute if score $targetArea custom3 matches 1.. run scoreboard players operation redTeamPercents tmp *= 100 const
execute if score $targetArea custom3 matches 1.. run scoreboard players operation redTeamPercents tmp /= 2600 const
execute if score $targetArea custom3 matches 1.. if score $targetArea custom2 matches 0 run bossbar set .mw:process name ["", [{"color": "aqua", "score": {"objective": "tmp", "name": "blueTeamPercents"}}, "%"], {"color": "yellow", "text": " | "}, [{"color": "red", "score": {"objective": "tmp", "name": "redTeamPercents"}}, "%"]]
execute if score $targetArea custom3 matches 1.. if score $targetArea custom2 matches 1..20 run bossbar set .mw:process name ["", [{"color": "aqua", "score": {"objective": "tmp", "name": "blueTeamPercents"}}, "%"], [{"color": "yellow", "text": " |"}, {"translate": "world.target_area.overtime"}, "| "], [{"color": "red", "score": {"objective": "tmp", "name": "redTeamPercents"}}, "%"]]
execute if score $targetArea custom3 matches 1.. if score $targetArea custom2 matches 21..40 run bossbar set .mw:process name ["", [{"color": "aqua", "score": {"objective": "tmp", "name": "blueTeamPercents"}}, "%"], [{"color": "yellow", "text": " ||"}, {"translate": "world.target_area.overtime"}, "|| "], [{"color": "red", "score": {"objective": "tmp", "name": "redTeamPercents"}}, "%"]]
execute if score $targetArea custom3 matches 1.. if score $targetArea custom2 matches 41..60 run bossbar set .mw:process name ["", [{"color": "aqua", "score": {"objective": "tmp", "name": "blueTeamPercents"}}, "%"], [{"color": "yellow", "text": " |||"}, {"translate": "world.target_area.overtime"}, "||| "], [{"color": "red", "score": {"objective": "tmp", "name": "redTeamPercents"}}, "%"]]
execute if score $targetArea custom3 matches 1.. if score $targetArea custom2 matches 61..80 run bossbar set .mw:process name ["", [{"color": "aqua", "score": {"objective": "tmp", "name": "blueTeamPercents"}}, "%"], [{"color": "yellow", "text": " ||||"}, {"translate": "world.target_area.overtime"}, "|||| "], [{"color": "red", "score": {"objective": "tmp", "name": "redTeamPercents"}}, "%"]]
### ...value according to the area process.
execute store result bossbar .mw:process value run scoreboard players get $targetArea custom1
## Overtime.
execute if score $targetArea custom2 matches 1.. run scoreboard players remove $targetArea custom2 1
execute if score $targetArea custom3 matches 4..5 if score $blueTeam custom1 = $maxAreaProcessMinusOne tmp if score redCount tmp matches 1.. run scoreboard players set $targetArea custom2 80
execute if score $targetArea custom3 matches 6..7 if score $redTeam custom1 = $maxAreaProcessMinusOne tmp if score blueCount tmp matches 1.. run scoreboard players set $targetArea custom2 80
## Add team process.
execute if score $targetArea custom3 matches 4..5 if score $blueTeam custom1 = $maxAreaProcessMinusOne tmp if score $targetArea custom2 matches 0 run scoreboard players add $blueTeam custom1 1
execute if score $targetArea custom3 matches 4..5 if score $blueTeam custom1 < $maxAreaProcessMinusOne tmp run scoreboard players add $blueTeam custom1 1
execute if score $targetArea custom3 matches 6..7 if score $redTeam custom1 = $maxAreaProcessMinusOne tmp if score $targetArea custom2 matches 0 run scoreboard players add $redTeam custom1 1
execute if score $targetArea custom3 matches 6..7 if score $redTeam custom1 < $maxAreaProcessMinusOne tmp run scoreboard players add $redTeam custom1 1
## Add area process.
### 1p 10s
### 2p 7.5s
### 3p 5s
execute if score $targetArea custom3 matches 2 if score blueCount tmp matches 0 run scoreboard players remove $targetArea custom1 5
execute if score $targetArea custom3 matches 2 if score blueCount tmp matches 1 if score redCount tmp matches 0 run scoreboard players add $targetArea custom1 3
execute if score $targetArea custom3 matches 2 if score blueCount tmp matches 2 if score redCount tmp matches 0 run scoreboard players add $targetArea custom1 4
execute if score $targetArea custom3 matches 2 if score blueCount tmp matches 3.. if score redCount tmp matches 0 run scoreboard players add $targetArea custom1 6
execute if score $targetArea custom3 matches 3 if score redCount tmp matches 0 run scoreboard players remove $targetArea custom1 5
execute if score $targetArea custom3 matches 3 if score blueCount tmp matches 0 if score redCount tmp matches 1 run scoreboard players add $targetArea custom1 3
execute if score $targetArea custom3 matches 3 if score blueCount tmp matches 0 if score redCount tmp matches 2 run scoreboard players add $targetArea custom1 4
execute if score $targetArea custom3 matches 3 if score blueCount tmp matches 0 if score redCount tmp matches 3.. run scoreboard players add $targetArea custom1 6
execute if score $targetArea custom3 matches 5 if score redCount tmp matches 0 run scoreboard players remove $targetArea custom1 5
execute if score $targetArea custom3 matches 5 if score blueCount tmp matches 0 if score redCount tmp matches 1 run scoreboard players add $targetArea custom1 3
execute if score $targetArea custom3 matches 5 if score blueCount tmp matches 0 if score redCount tmp matches 2 run scoreboard players add $targetArea custom1 4
execute if score $targetArea custom3 matches 5 if score blueCount tmp matches 0 if score redCount tmp matches 3.. run scoreboard players add $targetArea custom1 6
execute if score $targetArea custom3 matches 7 if score blueCount tmp matches 0 run scoreboard players remove $targetArea custom1 5
execute if score $targetArea custom3 matches 7 if score blueCount tmp matches 1 if score redCount tmp matches 0 run scoreboard players add $targetArea custom1 3
execute if score $targetArea custom3 matches 7 if score blueCount tmp matches 2 if score redCount tmp matches 0 run scoreboard players add $targetArea custom1 4
execute if score $targetArea custom3 matches 7 if score blueCount tmp matches 3.. if score redCount tmp matches 0 run scoreboard players add $targetArea custom1 6
## Handle win / lose.
execute if score $blueTeam custom1 >= $maxAreaProcess tmp run function world:components/target_area/switch_to_state_1
execute if score $blueTeam custom1 >= $maxAreaProcess tmp run function game:over
execute if score $redTeam custom1 >= $maxAreaProcess tmp run function world:components/target_area/switch_to_state_1
execute if score $redTeam custom1 >= $maxAreaProcess tmp run function game:over
