#!/usr/bin/env ruby
require 'lib/sprite'

module JakeTheSnake
  class Apple < Sprite
    attr_accessor :x, :y
    def initialize(x, y)
      @x = x
      @y = y
    end

    def draw(surface, apples, apple_surface)
      apples.each do |apple|
        blit(apple_surface, surface, apple.x, apple.y)
      end
    end
  end
end
