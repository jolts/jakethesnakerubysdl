#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/new_game'
require 'lib/high_score'
require 'lib/colorize'

module JakeTheSnake
  class Menu < Sprite
    attr_accessor :apple_x, :apple_y
    def initialize
      self.apple_x = 168
      self.apple_y = 176
    end

    def key_pressed(key)
      puts "Currently in: %s" % Colorize.new("red").colorize("Menu.key_pressed()")
      if key == SDL::Key::DOWN
        if @apple_y < 368
          @apple_y += 64
        end
        puts Colorize.new("yellow").colorize("KeyDown")+" pressed. Location: "+Colorize.new("blue").colorize(@apple_y.to_s)
      end
      if key == SDL::Key::UP
        if @apple_y > 176
          @apple_y -= 64
        end
        puts Colorize.new("yellow").colorize("KeyUp")+" pressed. Location: "+Colorize.new("blue").colorize(@apple_y.to_s)
      end
      if key == SDL::Key::RETURN
        handle_state
        puts Colorize.new("yellow").colorize("Return")+" pressed. Location: "+Colorize.new("blue").colorize(@apple_y.to_s)
      end
    end

    def clock_tick
      puts "Currently in: %s" % Colorize.new("red").colorize("Menu.clock_tick()")
    end

    def handle_state
      puts "Currently in: %s" % Colorize.new("red").colorize("Menu.handle_state()")
      case self.apple_y 
      when 176
        puts Colorize.new("cyan").colorize("Starting New Game...")
        $game.state = NewGame.new
      when 240
        puts Colorize.new("cyan").colorize("Starting New Multiplayer Game...")
        # TODO
        $game.state = MultiPlayer.new
      when 304
        puts Colorize.new("cyan").colorize("Loading Highscores...")
        $game.state = HighScore.new
      when 368
        puts Colorize.new("cyan").colorize("Jake The Snake is exiting...")
        SDL.quit
      end
    end

    def draw(surface)
      puts "Currently in: %s" % Colorize.new("red").colorize("Menu.draw()")
      menu_screen = load_image("./img/background_and_wall_menu.bmp")
      apple = load_image("./img/apple_menu.bmp")
      SDL::Surface.blit(menu_screen, 0, 0, 0, 0, surface, 0, 0)
      SDL::Surface.blit(apple, 0, 0, 0, 0,  surface, @apple_x, @apple_y)
    end
  end
end
