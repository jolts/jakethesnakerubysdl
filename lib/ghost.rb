#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/helpers'

module JakeTheSnake
  class Ghost
    attr_accessor :x, :y, :tick_interval

    include Sprite
    include Helpers

    def initialize(x=0, y=0)
      @x = x
      @y = y
      @tick_interval = 0
      @ghost_surface = Sprite::load_image("./img/ghost.bmp")
    end

    def draw(surface)
      Sprite::blit(@ghost_surface, surface, @x, @y)
    end

    def move(snake_head)
      if snake_head[:x] < @x
        @x -= 16
      elsif snake_head[:x] > @x
        @x += 16
      end
      
      if snake_head[:y] < @y
        @y -= 16
      elsif snake_head[:y] > @y
        @y += 16
      end
      @tick_interval = 0
    end

  end
end
