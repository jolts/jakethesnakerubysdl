#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/new_game'
require 'lib/high_score'
require 'lib/util'

module JakeTheSnake
  class Menu < Sprite
    attr_accessor :apple_x, :apple_y
    def initialize
      self.apple_x = 168
      self.apple_y = 176
    end

    def key_pressed(key)
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("Menu.key_pressed()")
      case key
      when SDL::Key::DOWN
        if @apple_y < 368
          @apple_y += 64
        end
        $stderr.puts Util.new("yellow").colorize("KeyDown")+" pressed. Location: "+Util.new("blue").colorize(@apple_y.to_s)
      when SDL::Key::UP
        if @apple_y > 176
          @apple_y -= 64
        end
        $stderr.puts Util.new("yellow").colorize("KeyUp")+" pressed. Location: "+Util.new("blue").colorize(@apple_y.to_s)
      when SDL::Key::RETURN
        handle_state
        $stderr.puts Util.new("yellow").colorize("Return")+" pressed. Location: "+Util.new("blue").colorize(@apple_y.to_s)
      when SDL::Key::S
        $stderr.puts Util.new("cyan").colorize("Starting New Singleplayer Game...")
        $game.state = NewGame.new
      when SDL::Key::M
        $stderr.puts Util.new("cyan").colorize("Starting New Multiplayer Game...")
        $game.state = MultiPlayer.new
      when SDL::Key::H
        $stderr.puts Util.new("cyan").colorize("Loading Highscores...")
        $game.state = HighScore.new
      when SDL::Key::Q
        $stderr.puts Util.new("cyan").colorize("Jake The Snake is exiting...")
        SDL.quit
      when SDL::Key::E
        SDL.Quit
      end
    end

    def clock_tick
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("Menu.clock_tick()")
    end

    def handle_state
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("Menu.handle_state()")
      case self.apple_y 
      when 176
        $stderr.puts Util.new("cyan").colorize("Starting New Singleplayer Game...")
        $game.state = NewGame.new
      when 240
        $stderr.puts Util.new("cyan").colorize("Starting New Multiplayer Game...")
        # TODO
        $game.state = MultiPlayer.new
      when 304
        $stderr.puts Util.new("cyan").colorize("Loading Highscores...")
        $game.state = HighScore.new
      when 368
        $stderr.puts Util.new("cyan").colorize("Jake The Snake is exiting...")
        SDL.quit
      end
    end

    def draw(surface)
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("Menu.draw()")
      menu_screen = load_image("./img/background_and_wall_menu.bmp")
      apple = load_image("./img/apple_menu.bmp")
      SDL::Surface.blit(menu_screen, 0, 0, 0, 0, surface, 0, 0)
      SDL::Surface.blit(apple, 0, 0, 0, 0,  surface, @apple_x, @apple_y)
    end
  end
end
