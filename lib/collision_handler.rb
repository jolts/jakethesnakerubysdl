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
        return true
      end
      return false
    end

    def is_fruit_collision(snake_head, fruit)
      if snake_head[:x] == fruit.x and snake_head[:y] == fruit.y
        return true
      end
      return false
    end

    def is_self_snake_collision(snake)
      i = snake.length
      snake_part = snake[i]
      until i == 1
        j = i - 1 unless i == 0
        snake_part2 = snake[j]
        i -= 1
        if snake_part2[:x] == snake[0][:x] and snake_part2[:y] == snake[0][:y]
          return true
        end
      end
      return false
      #  snake = Array.new(snake[1..-1])
      #  snake.each do |sp|
      #    if snake[0][:x] == sp[:x] and snake[0][:y] == sp[:y]
      #      return true
      #   end
      # end
      #return false
    end
  end
end

