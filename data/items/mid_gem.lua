-- Lua script of item bass_gem.
-- This script is executed only once for the whole game.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local item = ...
local game = item:get_game()


-- Event called when the game is initialized.
function item:on_started()

  -- Initialize the properties of your item here,
  -- like whether it can be saved, whether it has an amount
  -- and whether it can be assigned.
  item:set_savegame_variable("mid_gem")
  item:set_assignable(true)
end

function item:on_obtained()
   game:set_item_assigned(2, item)
end

-- Event called when the hero is using this item.
function item:on_using()
  local map = item:get_map()
  local hero = map:get_hero()
  local hero_x, hero_y = hero:get_position()
  local beam = map:create_custom_entity({
    direction = hero:get_direction(),
    x = hero_x,
    y = hero_y,
    width = 16,
    height = 16,
    layer = 2,
    model = "beam_mid"
  })
  
  beam:shoot()
  -- Define here what happens when using this item
  -- and call item:set_finished() to release the hero when you have finished.
  item:set_finished()
end

-- Event called when a pickable treasure representing this item
-- is created on the map.
function item:on_pickable_created(pickable)

  -- You can set a particular movement here if you don't like the default one.
end