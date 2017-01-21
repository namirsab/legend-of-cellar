-- Lua script of enemy fireball.
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

-- Event called when the enemy is initialized.
function enemy:on_created()

  -- Initialize the properties of your enemy here,
  -- like the sprite, the life and the damage.
  sprite = enemy:create_sprite("enemies/" .. enemy:get_breed())
  enemy:set_life(1)
  enemy:set_damage(1)
  enemy:set_layer_independent_collisions()
  enemy:set_invincible()
  enemy:set_traversable(true)
end


-- Event called when the enemy should start or restart its movements.
-- This is called for example after the enemy is created or after
-- it was hurt or immobilized.
function enemy:on_restarted()
  movement = sol.movement.create("straight")
  movement:set_angle(enemy:get_angle(hero))
  movement:set_speed(100)
  movement:set_max_distance(0)
  movement:set_smooth(false)
  movement:start(enemy)
end

function enemy:on_obstacle_reached(enemyMovement)
  print("Obstacle reached")
  enemy:set_life(0)
end
