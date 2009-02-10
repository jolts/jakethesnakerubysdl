#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../sprite'

module JakeTheSnake
  include Sprite

  class Ghost
    attr_accessor :x, :y, :tick_interval

    def initialize(x=0, y=0)
      @x, @y = x, y
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

    def respawn
      @x = rand(38) * 16 + 16
      @y = rand(28) * 16 + 16
    end
  end
end
