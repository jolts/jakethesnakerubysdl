#!/usr/bin/env ruby
require 'lib/game_engine'

module JakeTheSnake
  class Menu < GameEngine
    def initialize
    end

    def draw(surface)
      puts 'in draw()'
      menu_screen = load_image("./img/background_and_wall_menu.bmp")
      apple = load_image("./img/apple_menu.bmp")
      SDL::Surface.blit(menu_screen, 0, 0, 0, 0, surface, 0, 0)
    #SDL::Surface.blit(apple, 0, 0, 0, 0,  surface, 0, 0)
    end
  end
end
