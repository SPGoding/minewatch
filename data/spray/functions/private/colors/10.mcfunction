execute if score colorCode tmp matches 98 run data merge entity @s {Particle: "minecraft:dust 0.4000 0.8000 0.8000 0.28", Radius: 0.01f}
execute unless score colorCode tmp matches 98 runfunction spray:private/colors/11
