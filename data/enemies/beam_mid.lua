-- Lua script of enemy beam_2.
-- This script is executed every time an enemy with this model is created.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local enemy = ...
local Beam = require "scripts/enemies/beam"

Beam.initialize(enemy, {
  length = 50
});
