# char:1-pca/summon

summon minecraft:armor_stand ~ ~ ~ {Tags: ["char_sample", "char_sample_1-pca", "newly_summoned"], CustomName: '"1-pca"', Invisible: 1b, Invulnerable: 1b, Marker: 1b, NoGravity:1b}
execute as @e[type=minecraft:armor_stand,tag=newly_summoned] run function char:1-pca/summon_as

tag @e remove newly_summoned
