execute if score colorCode tmp matches 89 run data merge entity @s {Particle: "minecraft:dust 0.4000 0.4000 0.4000 0.28", Radius: 0.01f}
execute unless score colorCode tmp matches 89 runfunction spray:private/colors/117
