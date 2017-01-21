-- Lua script of custom entity beam.
-- This script is executed every time a custom entity with this model is created.

-- Feel free to modify the code below.
-- You can add more events and remove the ones you don't need.

-- See the Solarus Lua API documentation for the full specification
-- of types, events and methods:
-- http://www.solarus-games.org/doc/latest

local entity = ...
local Beam = require "scripts/custom_entities/beam"
local BeamTypes = require "scripts/constants/beam_types"

Beam.initialize(entity, {
  type = BeamTypes.BASS
})
