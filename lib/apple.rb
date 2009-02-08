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
      @apple_surface = Sprite.load_image("./img/apple.bmp")
      @x = x
      @y = y
    end

    def draw(surface, apple)
      Helpers.debug("In Apple.draw")
      Sprite.blit(@apple_surface, surface, apple.x, apple.y)
    end
    
    def move
      # Moves the apple
      # Is supposed to remove the last apple 
      # And change coord of the first one in apples array

      Helpers.debug("In Apple.move")
      self.apple_tick += 1
      if @apple_tick == 50
        #apple = apples[-1]
        #apples.pop
        x = rand(608)
        y = rand(448)
      end
      #end until Sprite.is_free(x, y, apples) Not yet fully working
      self.x = x
      self.y = y
      @apple_tick = 0
    end
  end
end
