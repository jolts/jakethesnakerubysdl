#!/usr/bin/env ruby
require 'sdl'

module JakeTheSnake
  class Sprite
    attr_accessor :apple_x, :apple_y, :choice, :direction 
    def initialize
    end

    def load_image(filename)
      SDL::Surface.load_bmp(filename).display_format
      #if loaded_image
      #  optimized_image = loaded_image.display_format
      #end
      #optimized_image
    end

    def draw(surface)
    end

    def key_pressed(key)
    end
  end
end

