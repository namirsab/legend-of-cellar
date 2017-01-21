-- Lua script of enemy chamaleon.
-- This script is executed every time an enemy with this model is created.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local enemy = ...
local game = enemy:get_game()
local map = enemy:get_map()
local hero = map:get_hero()
local sprite
local movement
local enemy_speed = 0
local fireball_timer

-- Event called when the enemy is initialized.
function enemy:on_created()

  -- Initialize the properties of your enemy here,
  -- like the sprite, the life and the damage.
  sprite=enemy:create_sprite("enemies/" .. enemy:get_breed())
  enemy:set_life(2)
  enemy:set_damage(1)
  enemy:set_hurt_style("boss")
  enemy:set_traversable(true)

  
end

-- Event called when the enemy should start or restart its movements.
-- This is called for example after the enemy is created or after
-- it was hurt or immobilized.
function enemy:on_restarted()

  movement = sol.movement.create("target")
  movement:set_target(hero)
  movement:set_speed(enemy_speed)
  movement:start(enemy)
  print("Chameleon restarted");

  sol.timer.start(enemy, 1500, function()
    print("Throw fireball")
    local fireball = enemy:create_enemy({ breed = "fireball", name = "fireball", x = 0, y = 0, layer = 1 })
    
    return true
  end)

  function movement:on_changed()
    -- The angle of the movement has changed: update the sprite accordingly.
    local direction = movement:get_direction4()
    enemy:get_sprite():set_direction(direction)
  end
end
