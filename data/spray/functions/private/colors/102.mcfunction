execute if score colorCode tmp matches 72 run data merge entity @s {Particle: "minecraft:dust 0.2000 1.0000 1.0000 0.28", Radius: 0.01f}
execute unless score colorCode tmp matches 72 run function spray:private/colors/103
