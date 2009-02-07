#!/usr/bin/env ruby

module JakeTheSnake
  class CollisionHandler
    def initialize
    end

    def is_collision(snake_body, sprite)
      snake_body.each do |body_part|
        if body_part[:x] == sprite.x && body_part[:y]
          true
        else
         false
        end
      end
    end
  end
end
