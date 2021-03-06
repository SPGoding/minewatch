#> fnmdp:tick
# @author K_Bai
# @url https://www.mcbbs.net/thread-777085-1-1.html
# @improvedBy SPGoding with a bunch of love!
# @tag
# @public
#define public tag fnmdp Indicates a fnmdp projectile.
#define public tag fnmdp_can_hit_enemy Shows that the current projectile can hit player's enemy.
#define public tag fnmdp_can_hit_teammate Shows that the current projectile can hit player's teammate.
#define public tag fnmdp_can_damage_hitted Shows that the current projectile can damage hitted players.
#define public tag fnmdp_can_damage_self Shows that the current projectile can damage its owner.
#define public tag fnmdp_flying Indicates that the current projectile have flying effect.
#define public tag fnmdp_have_acceleration Indicates that the current projectile have acceleration.
#define public tag fnmdp_elastic Indicates that the current projectile is elastic.
# @protected
#define protected tag fnmdp_hitted Indicates an entity hitted by the current projectile.
#define protected tag fnmdp_conflictable Indicates a player that can be hitted by the current projectile.
#define protected tag fnmdp_damagable Indicates a player that can be damaged by the current projectile.

# Flying effect.
execute if entity @s[tag=fnmdp_flying] run function fnmdp:private/flying

# Calculate velocities.
execute if entity @s[tag=fnmdp_have_acceleration] run function fnmdp:private/cal_acceleration

# Deal with flag tags.
execute if entity @s[tag=fnmdp_can_hit_enemy] run tag @e[tag=player,tag=enemy,tag=!died] add fnmdp_conflictable
execute if entity @s[tag=fnmdp_can_hit_teammate] run tag @e[tag=player,tag=teammate,tag=!died] add fnmdp_conflictable
execute if entity @s[tag=fnmdp_can_damage_hitted] run tag @e[tag=fnmdp_conflictable] add fnmdp_damagable
execute if entity @s[tag=fnmdp_can_damage_self] run tag @e[tag=player,tag=self,tag=!died] add fnmdp_damagable

# Move step by step so it wouldn't fly through walls.
## Vxyz params stores remaining velocities, used to check whether or not to loop.
scoreboard players operation Vx params = @s fnmdpVx
scoreboard players operation Vy params = @s fnmdpVy
scoreboard players operation Vz params = @s fnmdpVz
## Get positions.
### xyz tmp stores stable positions which are not in walls or entities.
execute store result score x tmp run data get entity @s Pos[0] 1000
execute store result score y tmp run data get entity @s Pos[1] 1000
execute store result score z tmp run data get entity @s Pos[2] 1000
## Move.
function fnmdp:private/small_step
## Set positions.
execute store result entity @s Pos[0] double 0.001 run scoreboard players get x tmp
execute store result entity @s Pos[1] double 0.001 run scoreboard players get y tmp
execute store result entity @s Pos[2] double 0.001 run scoreboard players get z tmp

# Deal with conflicts and damage.
tag @e remove fnmdp_conflictable
execute if entity @s[tag=fnmdp_can_damage_hitted] run function fnmdp:private/damage
tag @e remove fnmdp_damagable
tag @e remove fnmdp_hitted

# Boom.
scoreboard players add @s fnmdpAge 1
scoreboard players set boom tmp 0
#execute if entity @s[scores={fnmdpVx=-50..50,fnmdpVy=-50..50,fnmdpVz=-50..50}] run say 1
execute if entity @s[scores={fnmdpVx=-50..50,fnmdpVy=-50..50,fnmdpVz=-50..50}] run scoreboard players set boom tmp 1
#execute if score @s fnmdpAge >= @s fnmdpLife run say 2
execute if score @s fnmdpAge >= @s fnmdpLife run scoreboard players set boom tmp 1
execute if score boom tmp matches 1 run function fnmdp:private/boom
