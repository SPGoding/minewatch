#> spray:private/paint
# @as player

function spray:private/set_buffer

# Kill old paint.
kill @e[tag=my_marker,tag=spray_paint]

# Set 16×16=256 ray tracings.
scoreboard players set scanDirection params 1
scoreboard players set xCursor params 0
scoreboard players set yCursor params 0
## SPRAY TRACING!
execute positioned ~ ~1.8 ~ positioned ^0.4 ^0.4 ^ run function spray:private/trace_at_one_point

# Checkout.
scoreboard players operation @s sprayCool = sprayCool const

# Effect.
playsound spray:paint master @a
