# gc:tick

execute as @e[type=minecraft:tnt] store result score @s custom1 run data get entity @s Fuse
execute as @e[type=minecraft:tnt] unless score @s custom1 matches 2.. run kill @s
kill @e[type=minecraft:tnt_minecart]

execute store result score count tmp if entity @e
execute if score count tmp > gcLimit const run function gc:collect

# Calculate tps.
execute if score on tps matches 1.. store result score bolderSize tmp run worldborder get
execute if score on tps matches 1.. if score bolderSize tmp matches 3000 run worldborder set 3020 1
execute if score on tps matches 1.. if score bolderSize tmp matches 3000..3019 run scoreboard players add #counter tps 1
execute if score on tps matches 1.. if score bolderSize tmp matches 3020 run scoreboard players operation $ tps = #counter tps
execute if score on tps matches 1.. if score bolderSize tmp matches 3020 run scoreboard players reset #counter tps
execute if score on tps matches 1.. if score bolderSize tmp matches 3020 run worldborder set 3000
execute if score on tps matches 1.. run bossbar set .mw:tps players @a
execute unless score on tps matches 1.. run bossbar set .mw:tps players
execute if score on tps matches 1.. store result bossbar .mw:tps value run scoreboard players get $ tps
execute if score on tps matches 1.. if score $ tps matches 21.. run bossbar set .mw:tps color pink
execute if score on tps matches 1.. if score $ tps matches 18..20 run bossbar set .mw:tps color green
execute if score on tps matches 1.. if score $ tps matches 12..17 run bossbar set .mw:tps color yellow
execute if score on tps matches 1.. if score $ tps matches ..11 run bossbar set .mw:tps color red
execute if score on tps matches 1.. run bossbar set .mw:tps name {"color": "aqua", "score": {"objective": "tps", "name": "$"}}
