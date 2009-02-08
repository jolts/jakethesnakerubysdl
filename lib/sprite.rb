#!/usr/bin/env ruby
require 'sdl'

module JakeTheSnake
  module Sprite
    $image_buffer = Hash.new    
    
    def self.is_free(x, y, sprites)
      sprites.each do |sprite|
        if sprite.x == x && sprite.y == y
          false
        end
      end
      true
    end

    def self.load_image(filename)
      if $image_buffer[filename]
        return $image_buffer[filename]
      end
      loaded_image = SDL::Surface.load_bmp(filename).display_format
      $image_buffer[filename] = loaded_image
    end

    def self.draw(surface)
    end

    def self.key_pressed(key)
    end

    def self.blit(src, dst, dstX, dstY)
      SDL::Surface.blit(src, 0, 0, 0, 0, dst, dstX, dstY)
    end
  end
end
