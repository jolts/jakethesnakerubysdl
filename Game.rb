#!/usr/bin/env ruby
require 'sdl'
require 'lib/sprite'
require 'lib/menu'
require 'lib/new_game'
require 'lib/high_score'

module JakeTheSnake
  class Game
    attr_accessor :state
    attr_reader :screen, :random_height, :random_width 

    def initialize(height=640, width=480, full_screen=false)
      @height = height
      @width = width
      @full_screen = full_screen
      @random_height = rand(608)
      @random_width = rand(448)
      @state = Menu.new
      @tick_interval = SDL.delay(50)
      @screen = SDL::Screen.open(@height,@width , 32, SDL::SWSURFACE)
    end

    def start_game
      SDL.init(SDL::INIT_VIDEO)

      while true
        next_tick = SDL.get_ticks.to_i + @tick_interval.to_i

        while event = SDL::Event.poll
          case event
          when SDL::Event::KeyDown
            @state.key_pressed(event.sym)
          end
          @state.clock_tick
          @state.draw(@screen)
          @screen.flip          
          
          if SDL.get_ticks.to_i < next_tick
            SDL.delay(next_tick - SDL.get_ticks.to_i)
          end
        end
      end
    end
  end

  begin
    $game = Game.new(640, 480, false)
    $game.start_game
  ensure
  end
end
