#!/usr/bin/env ruby
require 'sdl'
require 'lib/sprite'
require 'lib/menu'
require 'lib/new_game'
require 'lib/high_score'

module JakeTheSnake
  class GameEngine
    attr_accessor :state
    attr_reader :screen, :random_height, :random_width, :running

    def initialize(height=640, width=480, full_screen=false, state=Menu.new)
      @height = height
      @width = width
      @full_screen = full_screen
      @random_height = rand(608)
      @random_width = rand(448)
      $running = true
      @state = state
      @tick_interval = 100
      @screen = SDL::Screen.open(@height, @width, 32, SDL::SWSURFACE)
    end

    def start_game
      SDL.init(SDL::INIT_VIDEO)

      while $running
        next_tick = SDL.get_ticks.to_i + @tick_interval
        
        while event = SDL::Event.poll
          case event
          when SDL::Event::KeyDown
            @state.key_pressed(event.sym)
          when SDL::Event::Quit
            self.running = false
          end
        end

        @state.clock_tick
        @state.draw(@screen)
        @screen.flip
        if SDL.get_ticks.to_i < next_tick
          SDL.delay(next_tick - SDL.get_ticks.to_i)
        end
      end
      $running = false
    end
  end
end
