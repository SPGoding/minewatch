execute if score colorCode tmp matches 36 run data merge entity @s {Particle: "minecraft:dust 0.0000 1.0000 1.0000 0.28", Radius: 0.01f}
execute unless score colorCode tmp matches 36 runfunction spray:private/colors/72
