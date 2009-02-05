#!/usr/bin/env ruby
require 'lib/sprite'

module JakeTheSnake
  class Menu < Sprite
    attr_accessor :apple_x, :apple_y
    def initialize
      self.apple_x = 168
      self.apple_y = 176
    end
    
    def key_pressed(key)
      puts 'in Menu.key_pressed()'
      if key == SDL::Key::DOWN
        if @apple_y < 368
          @apple_y += 64
        end
        puts @apple_y
      end
      if key == SDL::Key::UP
        if @apple_y > 176
          @apple_y -= 64
        end
        puts @apple_y
      end
    end
    
    def clock_tick
      puts 'in Menu.clock_tick()'
    end
    
    def draw(surface)
      puts 'in Menu.draw()'
      menu_screen = load_image("./img/background_and_wall_menu.bmp")
      apple = load_image("./img/apple_menu.bmp")
      SDL::Surface.blit(menu_screen, 0, 0, 0, 0, surface, 0, 0)
      SDL::Surface.blit(apple, 0, 0, 0, 0,  surface, @apple_x, @apple_y)
    end
  end
end
