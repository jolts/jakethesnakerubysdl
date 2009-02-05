#!/usr/bin/env ruby
require 'sdl'
require 'lib/sprite'
require 'lib/menu'
require 'lib/new_game'
require 'lib/high_score'
require 'lib/colorize'

module JakeTheSnake
  class Game
    attr_accessor :state
    attr_reader :screen, :height, :width, :full_screen, :random_height, :random_width, :engine
    def initialize(height, width, full_screen)
      @height = height
      @width = width
      @full_screen = full_screen
      @random_height = rand(608)
      @random_width = rand(448)
      @sprite = Sprite.new
      @tick_interval = SDL.delay(50)
      @@state = Menu.new
      @screen = SDL::Screen.open(@height,@width , 32, SDL::SWSURFACE)
      puts "Currently in: %s" % colorize("red", "initialize()").to_s
    end

    def start_game
      SDL.init(SDL::INIT_VIDEO)
      running = true

      while running
        next_tick = SDL.get_ticks.to_i + @tick_interval.to_i
        
        while event = SDL::Event.poll
          case event
          when SDL::Event::KeyDown
            if event.sym == SDL::Key::RETURN
              handle_state
            end
            @@state.key_pressed(event.sym)
            puts colorize("yellow", "KeyDown").to_s
          end
          @@state.clock_tick
          @@state.draw(@screen)
          @screen.flip          

          if (SDL.get_ticks.to_i < next_tick)
            SDL.delay(next_tick - SDL.get_ticks.to_i)
          end
          puts "Currently in: %s" % colorize("red", "loop()").to_s
        end
      end
    end

    def end_game
      SDL.quit
    end
  end

  begin
    Game.new(640, 480, false).start_game
  rescue Interrupt
    puts colorize("red", "\nGame stopped. ^C by user?").to_s
  rescue Exception => exp
    puts colorize("red", "Exception:").to_s+" #{exp.message}"
  end
end
