#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/helpers'

module JakeTheSnake
  include Sprite
  include Helpers

  class Carrot
    attr_accessor :x, :y, :tick_interval
    def initialize(x=0, y=0)
      @carrot_surface = Sprite::load_image("./img/carrot.bmp")
      @x = x
      @y = y
      @tick_interval = 0
    end

    def draw(surface, carrot)
      Sprite::blit(@carrot_surface, surface, carrot.x, carrot.y)
    end

    def move
      self.x = rand(38) * 16 + 16
      self.y = rand(28) * 16 + 16
    end
  end
end
