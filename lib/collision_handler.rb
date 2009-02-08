#!/usr/bin/env ruby

module JakeTheSnake
  class CollisionHandler
    def initialize
    end

    def is_wall_collision(snake_head, wall)
      if snake_head.x < wall.x or snake_head.y < wall.y or snake_head.x + 16 > wall.x + wall.w or snake_head.y + 16 > wall.y + wall.y
        true
      else
        false
      end
    end

    def is_sprite_collision(snake_body, sprite)
      # Checks whether any part of the snake collided with sprite x/y
      snake_body.each do |body_part|
        if body_part[:x] == sprite.x && body_part[:y] == sprite.y
          true
        end
      end
      false
    end

    def is_self_snake_collision(snake)
    end
  end
end
