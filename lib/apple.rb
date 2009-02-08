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

    def draw(surface, apples)
      Helpers.debug("In Apple.draw")
      apples.each do |apple|
        Sprite.blit(@apple_surface, surface, apple.x, apple.y)
      end
    end
    
    def move(apples)
      @apple_tick += 1
      if @apple_tick == 20
        apple = apples[-2]
        apples.pop
        begin
          x = rand(608)
          y = rand(448)
        end until Sprite.is_free(x, y, apples)
        apple.x = x
        apple.y = y
        apples[0] = apple
        @apple_tick = 0
      end
    end

    def is_free(x, y)
      @apples.each do |apple|
        if apple.x == x && apple.y == y
          false
        else
          true
        end
      end
    end      
  end
end
