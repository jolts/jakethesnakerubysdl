#!/usr/bin/env ruby
require 'sdl'

module JakeTheSnake
  class Sprite
    attr_accessor :apple_x, :apple_y, :choice, :direction 
    
    # Keeps track of already loaded images
    $image_buffer = Hash.new
    
    def initialize
    end

    

    def load_image(filename)
      if $image_buffer[filename]
        # If file has already been loaded, return
        return $image_buffer[filename]
      end
      loaded_image = SDL::Surface.load_bmp(filename).display_format
      $image_buffer[filename] = loaded_image
    end

    def draw(surface)
    end

    def key_pressed(key)
    end

    def blit(src, dst, dstX, dstY)
      SDL::Surface.blit(src, 0, 0, 0, 0, dst, dstX, dstY)
    end
  end
end

