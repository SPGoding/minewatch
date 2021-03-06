# char:2-steve/private/skill_passive_b_do

# Effect.
playsound minecraft:item.totem.use master @a[tag=!self]
particle minecraft:totem_of_undying ~ ~1 ~ 1 1 1 0 100 force @a[tag=!self]
replaceitem entity @s weapon.offhand minecraft:totem_of_undying
effect give @s minecraft:instant_damage 1 16 true
tellraw @a ["❤ ", {"selector": "@s"}]

# Revive.
teleport @s ~ ~0.1 ~
tag @s remove died_force_player
gamemode adventure
title @s clear
scoreboard players reset @s hhDamagedM
scoreboard players reset @s hhDamagedR
scoreboard players reset @s hhHealed
scoreboard players reset @s hhReviveTime
scoreboard players set @s hhInnateHealth 150
scoreboard players set @s hhTempShield 200
scoreboard players set @s hhTempShieldTime 200
tag @s remove died

# Cooldown.
scoreboard players operation @s charSkillPCool = @e[limit=1,tag=my_char] charSkillPCool
