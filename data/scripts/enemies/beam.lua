local Beam = {}

function Beam.initialize(enemy, props)
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
    enemy:set_layer_independent_collisions(true)
    enemy:set_traversable(true)
  end
  
  -- Event called when the enemy should start or restart its movements.
  -- This is called for example after the enemy is created or after
  -- it was hurt or immobilized.
  function enemy:on_restarted()
    
    movement = sol.movement.create("straight")
    movement:set_angle(enemy:get_angle(hero))
    movement:set_speed(100)
    movement:set_smooth(false)
    movement:set_max_distance(props.length)
    
    function movement:on_finished()
      enemy:remove()
    end
    movement:start(enemy)
  end
end


return Beam
