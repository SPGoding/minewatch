# char:2-steve/private/skill_active_a_boom

# Effect.
particle minecraft:block minecraft:obsidian ~ ~ ~ 0.5 0.5 0.5 0 20 force

# Summon marker.
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~ ~-1 {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~ ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~ ~1 {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~1 ~-1 {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_2-steve_obsidian_wall_main", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~1 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~1 ~1 {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~2 ~-1 {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~2 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 1 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~2 ~1 {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}

execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~-1 ~ ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_2-steve_obsidian_wall_main", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~ ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~1 ~ ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~-1 ~1 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~1 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~1 ~1 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~-1 ~2 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~ ~2 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}
execute if score @s custom1 matches 2 align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:area_effect_cloud ~1 ~2 ~ {Duration: 32767, NoGravity: 1b, Tags: ["char_2-steve_obsidian_wall", "char_attachment", "marker_with_uid", "my_marker", "newly_summoned", "protected"]}

# Setblock.
execute as @e[type=minecraft:area_effect_cloud,tag=newly_summoned] at @s if block ~ ~ ~ minecraft:obsidian unless entity @e[type=minecraft:area_effect_cloud,tag=char_2-steve_obsidian_wall,tag=!newly_summoned,distance=..0.1] run scoreboard players set @s custom1 1
execute as @e[type=minecraft:area_effect_cloud,tag=newly_summoned] at @s if block ~ ~ ~ minecraft:obsidian if entity @e[type=minecraft:area_effect_cloud,tag=char_2-steve_obsidian_wall,tag=!newly_summoned,distance=..0.1,scores={custom1=1}] run scoreboard players set @s custom1 1
execute as @e[type=minecraft:area_effect_cloud,tag=newly_summoned] at @s run kill @e[type=minecraft:area_effect_cloud,tag=char_2-steve_obsidian_wall,tag=!newly_summoned,distance=..0.1]
execute as @e[type=minecraft:area_effect_cloud,tag=newly_summoned] at @s if block ~ ~ ~ minecraft:air run playsound minecraft:block.metal.place master @a
execute as @e[type=minecraft:area_effect_cloud,tag=newly_summoned] at @s if block ~ ~ ~ minecraft:air run setblock ~ ~ ~ minecraft:obsidian

tag @e remove newly_summoned
