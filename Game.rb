#!/usr/bin/env ruby
require 'sdl'
require 'lib/game_engine'
require 'lib/menu'

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
      @engine = GameEngine.new
      @tick_interval = SDL.delay(50)
      @state = Menu.new
      @screen = SDL::Screen.open(@height,@width , 32, SDL::SWSURFACE)
      puts 'in initialize()'
    end

    def start_game
      SDL.init(SDL::INIT_VIDEO)
      running = true

      while running
        next_tick = SDL.get_ticks.to_i + @tick_interval.to_i
        
        while event = SDL::Event.poll
          @state.draw(@screen)
          case event
          when SDL::Event::KeyDown
            @state.key_pressed(event.sym)
            puts "KeyDown"
          end
          @state.clock_tick
          @screen.flip          

          if (SDL.get_ticks.to_i < next_tick)
            SDL.delay(next_tick - SDL.get_ticks.to_i)
          end
          puts 'in loop()'
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
    puts "\nGame stopped. ^C by user?"
  rescue Exception => exp
    puts "Exception: #{exp.message}"
  end
end
