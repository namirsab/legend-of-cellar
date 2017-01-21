-- Lua script of enemy beamer.
-- This script is executed every time an enemy with this model is created.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

-- Beamer enemy will attack the hero with a beam of the defined wave
-- when the hero is close to it. 

local enemy = ...
local Beamer = require "scripts/enemies/beamer"

Beamer.initialize(enemy, {
  wave_type = Beamer.WAVE_BASS,
  shot_distance = 50,
  shot_frequency = 50
})
