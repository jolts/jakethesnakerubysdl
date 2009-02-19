#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/sprite'

module JakeTheSnake
  include Sprite

  class CollisionHandler
    attr_accessor :wall

    def initialize
      @wall = { :x => 16, :y => 16, :w => 608, :h => 448 }
    end

    def is_wall_collision(snake_head)
      if snake_head[0][:x] < @wall[:x] or snake_head[0][:y] < @wall[:y] or snake_head[0][:x] + 16 > @wall[:x] + @wall[:w] or snake_head[0][:y] + 16 > @wall[:y] + @wall[:h]
        return true
      end
      false
    end

    def is_collision(snake_head, fruit)
      if snake_head[:x] == fruit.x and snake_head[:y] == fruit.y
        return true
      end
      false
    end

    def is_ghost_collision(snake, ghost)
      snake.each do |body_part|
        if body_part[:x] == ghost.x and body_part[:y] == ghost.y
          return true
        end
      end
      false
    end

    def is_self_snake_collision(snake)
      i = snake.length
      until i == 1
        j = i - 1 unless i == 0
        snake_part = snake[j]
        i -= 1
        if snake_part[:x] == snake[0][:x] and snake_part[:y] == snake[0][:y]
          return true
        end
      end
      false
    end
  end
end
