#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/new_game'
require 'lib/high_score'

module JakeTheSnake
  class Menu < Sprite
    attr_accessor :apple_x, :apple_y, :choice

    def initialize
      @apple_x = 168
      @apple_y = 176
      @choice = 1
    end

    def key_pressed(key)
      if key == SDL::Key::DOWN && @choice < 4
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
        $stderr.puts "MultiPlayer is disabled for now."
        $running = false
      when 3
        $game.state = HighScore.new
      when 4
        $stderr.puts "Jake The Snake is exiting."
        $running = false
      end
    end

    def draw(surface)
      menu_screen = load_image("./img/background_and_wall_menu.bmp")
      apple = load_image("./img/apple_menu.bmp")
      SDL::Surface.blit(menu_screen, 0, 0, 0, 0, surface, 0, 0)
      SDL::Surface.blit(apple, 0, 0, 0, 0,  surface, @apple_x, @apple_y)
    end
  end
end
