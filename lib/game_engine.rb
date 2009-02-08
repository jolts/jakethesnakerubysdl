#!/usr/bin/env ruby
require 'sdl'
require 'lib/menu'
require 'lib/new_game'
require 'lib/high_score'

module JakeTheSnake
  class GameEngine
    attr_accessor :state
    attr_reader :screen, :random_height, :random_width, :running

    def initialize(height=640, width=480, state=nil)
      SDL.init(SDL::INIT_VIDEO) 
      @height = height
      @width = width
      @random_height = rand(608)
      @random_width = rand(448)
      $running = true
      @state = Menu.new
      @tick_interval = 100
      @screen = SDL::Screen.open(@height, @width, 32, SDL::SWSURFACE)
    end

    def update_screen
      @state.clock_tick
      @state.draw(@screen)
      @screen.flip
    end

    def game_loop
      while $running
        next_tick = SDL.get_ticks.to_i + @tick_interval
        while event = SDL::Event.poll
          case event
          when SDL::Event::KeyDown
            @state.key_pressed(event.sym)
          when SDL::Event::Quit
            $running = false
          end
        end

        update_screen()
        if SDL.get_ticks.to_i < next_tick
          SDL.delay(next_tick - SDL.get_ticks.to_i)
        end
      end
      $running = false
    end

    def start_game
      update_screen()
      while $running
        event = SDL::Event.poll
        case event
        when SDL::Event::KeyDown
          @state.key_pressed(event.sym)
          @state.clock_tick
          @state.draw(@screen) 
          @screen.flip
        when SDL::Event::Quit
          $running = false
        end
      end
    end
  end
end
