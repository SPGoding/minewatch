# hh:vanilla_combat/range_attack_by_trident
# @as player

execute unless score $game custom1 matches 2 run function player:add_tags

execute unless score $game custom1 matches 2 run scoreboard players add @e[sort=nearest,limit=1,tag=enemy,tag=be_attacked] hhDamagedR 50
execute unless score $game custom1 matches 2 run scoreboard players add @e[sort=nearest,limit=1,tag=enemy,tag=be_attacked] hhDamagedB 50
execute unless score $game custom1 matches 2 run scoreboard players add @e[sort=nearest,limit=1,tag=enemy,tag=be_attacked] hhDamagedBTime 50
execute unless score $game custom1 matches 2 run scoreboard players set @e[sort=nearest,limit=1,tag=enemy,tag=be_attacked] hhLastDamageWay 10
execute unless score $game custom1 matches 2 run scoreboard players operation @e[sort=nearest,limit=1,tag=enemy,tag=be_attacked] hhLastDamageUid = @s uid

execute unless score $game custom1 matches 2 run function player:remove_tags

advancement revoke @s only hh:vanilla_combat/range_attack_by_trident
