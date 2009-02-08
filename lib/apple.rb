#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/helpers'

module JakeTheSnake
  include Sprite
  include Helpers

  class Apple
    attr_accessor :x, :y, :apple_tick
    def initialize(x=0, y=0)
      @apple_tick = 0
      @apple_surface = Sprite::load_image("./img/apple.bmp")
      @x = x
      @y = y
    end

    def draw(surface, apple)
      Sprite::blit(@apple_surface, surface, apple.x, apple.y)
    end
    
    def move
      self.x = rand(38) * 16 + 16 
      self.y = rand(28) * 16 + 16
    end
    #end until Sprite.is_free(x, y, apples) Not yet fully working
    #self.x = x
    #self.y = y
    #@apple_tick = 0
  end
end
