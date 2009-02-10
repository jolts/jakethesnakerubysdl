#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../sprite'

module JakeTheSnake
  include Sprite

  class Apple
    attr_accessor :x, :y, :tick_interval

    def initialize(x=0, y=0)
      @apple_surface = Sprite::load_image("./img/apple.bmp")
      @x, @y = x, y
      @tick_interval = 0
    end

    def draw(surface, apple)
      Sprite::blit(@apple_surface, surface, apple.x, apple.y)
    end

    def move
      self.x = rand(38) * 16 + 16 
      self.y = rand(28) * 16 + 16
    end
  end
end
