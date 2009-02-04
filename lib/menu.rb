#!/usr/bin/env ruby
require 'lib/game_engine'

module JakeTheSnake
  class Menu < GameEngine
    attr_writer :apple_x, :apple_y
    def initialize
      @apple_x = 168
      @apple_y = 176
    end
    
    def key_pressed(key)
      puts 'in key_pressed()'
      if key == SDL::Key::DOWN
        @apple_y += 64
      end
      if key == SDL::Key::UP
        @apple_y -= 64
      end
    end
    
    def clock_tick
      puts 'in clock_tick()'
    end
    
    def draw(surface)
      puts 'in draw()'
      menu_screen = load_image("./img/background_and_wall_menu.bmp")
      apple = load_image("./img/apple_menu.bmp")
      SDL::Surface.blit(menu_screen, 0, 0, 0, 0, surface, 0, 0)
      SDL::Surface.blit(apple, 0, 0, 0, 0,  surface, @apple_x, @apple_y)
    end
  end
end
