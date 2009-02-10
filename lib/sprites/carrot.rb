#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../sprite'

module JakeTheSnake
  include Sprite

  class Carrot
    attr_accessor :x, :y, :tick_interval

    def initialize(x=0, y=0)
      @carrot_surface = Sprite::load_image("./img/carrot.bmp")
      @x, @y = x, y
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
