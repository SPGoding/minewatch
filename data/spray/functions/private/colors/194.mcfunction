execute if score colorCode tmp matches 191 run data merge entity @s {Particle: "minecraft:dust 1.0000 0.2000 0.2000 0.28", Radius: 0.01f}
execute unless score colorCode tmp matches 191 runfunction spray:private/colors/195
