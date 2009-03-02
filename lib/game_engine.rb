#!/usr/bin/env ruby

require 'sdl'

require File.dirname(__FILE__) + '/menu'
require File.dirname(__FILE__) + '/new_game'

module JakeTheSnake
  class GameEngine
    attr_accessor :state
    attr_reader :screen, :running

    def initialize(height=640, width=480, state=nil)
      SDL.init(SDL::INIT_VIDEO) 
      @height, @width = height, width
      @tick_interval = 80
      @state = Menu.new
      @screen = SDL::Screen.open(@height, @width, 32, SDL::SWSURFACE)
      $running = true
    end

    def init
      loop do
        next_tick = SDL.get_ticks.to_i + @tick_interval
        event = SDL::Event.poll
        while event
          case event
          when SDL::Event::KeyDown
            @state.key_pressed(event.sym)
          when SDL::Event::Quit
            SDL.Quit
          end
        end

        @state.clock_tick
        @state.draw(@screen)
        @screen.flip
        if SDL.get_ticks.to_i < next_tick
          SDL.delay(next_tick - SDL.get_ticks.to_i)
        end
      end if $running

      $running = false
    end
  end
end
