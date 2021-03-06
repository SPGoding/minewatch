# hh:death/show_death_message
# @as players going to die
# @tag hh_killer

summon minecraft:area_effect_cloud ~ ~ ~ {Tags: ["newly_summoned"], Duration: 1}

# General ways.
execute if score @s hhLastDamageWay matches 1 run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§r\\uE001"'
execute if score @s hhLastDamageWay matches 2 run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§r\\uE002"'
execute if score @s hhLastDamageWay matches 9 run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§r\\u2620"'
execute if score @s hhLastDamageWay matches 10 run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§4\\uE002"'
execute if score @s hhLastDamageWay matches 17 run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§4\\u2620"'
execute unless score @s hhLastDamageWay matches 0.. run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§r\\u2620"'
# Specific ways.
execute if score @e[tag=hh_killer,limit=1] charID matches 2 if score @s hhLastDamageWay matches 3 run data modify entity @e[type=minecraft:area_effect_cloud,tag=newly_summoned,limit=1] CustomName set value '"§4\\uE003"'

# Message.
execute unless entity @e[tag=hh_killer] run tellraw @a ["", {"selector": "@e[type=minecraft:area_effect_cloud,tag=newly_summoned]"}, " ", {"selector": "@s"}]
execute if entity @e[tag=hh_killer] run tellraw @a ["", {"selector": "@e[tag=hh_killer]"}, " ", {"selector": "@e[type=minecraft:area_effect_cloud,tag=newly_summoned]"}, " ", {"selector": "@s"}]

kill @e[tag=newly_summoned]
