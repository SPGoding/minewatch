execute if score colorCode tmp matches 141 run data merge entity @s {Particle: "minecraft:dust 0.6000 1.0000 1.0000 0.28", Radius: 0.01f}
execute unless score colorCode tmp matches 141 runfunction spray:private/colors/156
