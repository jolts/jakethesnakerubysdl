#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/new_game'
require 'lib/helpers'

module JakeTheSnake
  include Sprite
  include Helpers
  class Menu
    attr_accessor :apple_x, :apple_y, :choice

    def initialize
      @apple_x = 168
      @apple_y = 176
      @choice = 1
    end

    def key_pressed(key)
      if key == SDL::Key::DOWN && @choice < 3
        @choice += 1
        @apple_y += 64
      elsif key == SDL::Key::UP && @choice > 1
        @choice -= 1
        @apple_y -= 64
      elsif key == SDL::Key::RETURN
        handle_state()
      end
    end

    def clock_tick
    end

    def handle_state
      case @choice
      when 1
        $game.state = NewGame.new
      when 2
        Helpers::debug("HighScore not available yet.")
        #$game.state = HighScore.new
      when 3
        Helpers::debug("Jake The Snake is exiting.")
        $running = false
      end
    end

    def draw(surface)
      menu_screen = Sprite::load_image("./img/background_and_wall_menu.bmp")
      apple = Sprite::load_image("./img/apple_menu.bmp")
      Sprite.blit(menu_screen, surface, 0, 0) 
      Sprite.blit(apple, surface, @apple_x, @apple_y)
    end
  end
end
