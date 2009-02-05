#!/usr/bin/env ruby
require 'sdl'

module JakeTheSnake
  class Sprite
    attr_accessor :apple_x, :apple_y, :choice
    def initialize
      @choice = { 176 => 'new game', 304 => 'high score', 368 => 'exit'}
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
