local Beam = {}

function Beam.initialize(entity, props)
  local game = entity:get_game()
  local map = entity:get_map()
  local hero = map:get_hero()
  local sprite
  local movement
  
  -- Event called when the enemy is initialized.
  function entity:on_created()
    -- Initialize the properties of your enemy here,
    -- like the sprite, the life and the damage.
    sprite = entity:create_sprite("entities/" .. entity:get_model() .. "_mid")
    entity:set_layer_independent_collisions(false)
    entity:set_traversable_by(true)
    entity:set_can_traverse("camera", true)
    entity:set_can_traverse("crystal_block", true)
    entity:set_can_traverse("hero", true)
    entity:set_can_traverse("jumper", true)
    entity:set_can_traverse("stairs", false)
    entity:set_can_traverse("stream", true)
    entity:set_can_traverse("switch", true)
    entity:set_can_traverse("teletransporter", true)
    entity:set_can_traverse_ground("deep_water", true)
    entity:set_can_traverse_ground("shallow_water", true)
    entity:set_can_traverse_ground("hole", true)
    entity:set_can_traverse_ground("lava", true)
    entity:set_can_traverse_ground("prickles", true)
    entity:set_can_traverse_ground("low_wall", true)    


    entity:add_collision_test("overlapping", function (entity, other)
      if (other:get_type() == "enemy") then
        print("Collision happened")
        other:remove_life(1)
      end
      
    end)
  end


  function entity:shoot()
    local direction = hero:get_direction()
    
    local movement = sol.movement.create("straight")
    movement:set_speed(100)
    movement:set_max_distance(50)
    movement:set_angle(direction * math.pi / 2)
    
    function movement:on_changed()
      -- The angle of the movement has changed: update the sprite accordingly.
      local direction = movement:get_direction4()
      entity:get_sprite():set_direction(direction)
    end   

    function movement:on_finished()
      entity:remove()
    end
    
    movement:start(entity)
  end

end


return Beam
