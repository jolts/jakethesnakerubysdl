#!/usr/bin/env ruby
require 'sdl'

module JakeTheSnake
  class Sprite
    def initialize
    end

    def load_image(filename)
      loaded_image = SDL::Surface.load_bmp(filename)
      if loaded_image
        optimized_image = loaded_image.display_format
      end
      optimized_image
    end
  end
end
