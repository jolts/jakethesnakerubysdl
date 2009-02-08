#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/apple'

module JakeTheSnake
  class CollisionHandler
    include Sprite

    def initialize
      @wall = { :x => 16, :y => 16, :w => 608, :h => 448 }
    end

    def is_wall_collision(snake_head)
      if snake_head[0][:x] < @wall[:x] or snake_head[0][:y] < @wall[:y] or snake_head[0][:x] + 16 > @wall[:x] + @wall[:w] or snake_head[0][:y] + 16 > @wall[:y] + @wall[:h]
        true
      else
        false
      end
    end

    def is_sprite_collision(snake_head, sprite)
      if snake_head[:x] == sprite.x and_head[:y] == sprite.y
        return true
      end
      return false
    end

    def is_self_snake_collision(snake)
      false
    end
  end
end
