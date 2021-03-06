local Beamer = {}

function Beamer.initialize(enemy, props)
  print(props.wave_type)
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
    enemy:set_life(5)
    enemy:set_damage(0)
    enemy:set_traversable(false)
  end
  
  -- Event called when the enemy should start or restart its movements.
  -- This is called for example after the enemy is created or after
  -- it was hurt or immobilized.
  function enemy:on_restarted()
    enemy:set_can_attack(true)
    movement = sol.movement.create("random")
    --movement:set_target(hero)
    movement:set_speed(props.speed)
    movement:start(enemy)
    
    sol.timer.start(enemy, props.shot_frequency, function()
      return attack(enemy, hero, props)
    end)
    
    
    function movement:on_changed()
      -- The angle of the movement has changed: update the sprite accordingly.
      local direction = movement:get_direction4()
      enemy:get_sprite():set_direction(direction)
    end
  end
  
  function attack(the_enemy, the_hero, props)
    local distance_to_hero = the_enemy:get_distance(the_hero)
    if distance_to_hero < props.shot_distance then
      the_enemy:get_movement():set_speed(0)
      local enemy_direction = the_enemy:get_direction4_to(hero)
      local x, y = the_enemy:get_position()
      local damage = the_enemy:get_damage()
      local beam = create_beam(the_enemy, enemy_direction, props)
    else
      the_enemy:get_movement():set_speed(props.speed)
    end
    return true -- repeat the timer
  end
  
  function create_beam(the_enemy, direction, props)
    local beam_breed = "beam_" .. props.wave_type
    local beam = the_enemy:create_enemy({
      name = "beam",
      layer = 1,
      x = 0,
      y = 0,
      breed = beam_breed,
      ["direction"] = direction,
    })
      
    return beam;
  end

  

  return enemy
end

return Beamer
