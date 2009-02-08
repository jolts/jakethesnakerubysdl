#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/apple'

module JakeTheSnake
  class CollisionHandler
    include Sprite

    def initialize
      @wall = { :x => 16, :y => 16, :w => 608, :h => 448}
    end

    def is_wall_collision(snake_head)
      if snake_head[0][:x] < @wall[:x] or snake_head[0][:y] < @wall[:y] or snake_head[0][:x] + 16 > @wall[:x] + @wall[:w] or snake_head[0][:y] + 16 > @wall[:y] + @wall[:h]
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
