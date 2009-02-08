#!/usr/bin/env ruby
require 'sdl'

module Sprite
  $image_buffer = Hash.new    
    
  def Sprite.is_free(x, y, sprites)
    sprites.each do |sprite|
      if sprite.x == x && sprite.y == y
        false
      else
        true
      end
    end
  end

  def Sprite.load_image(filename)
    if $image_buffer[filename]
      return $image_buffer[filename]
    end
    loaded_image = SDL::Surface.load_bmp(filename).display_format
    $image_buffer[filename] = loaded_image
  end

  def Sprite.draw(surface)
  end

  def Sprite.key_pressed(key)
  end

  def Sprite.blit(src, dst, dstX, dstY)
    SDL::Surface.blit(src, 0, 0, 0, 0, dst, dstX, dstY)
  end
end
