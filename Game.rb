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
      @menu = Menu.new
      @screen = SDL::Screen.open(@height,@width , 32, SDL::SWSURFACE)
      puts 'in initialize()'
    end

    def start_game
      SDL.init(SDL::INIT_VIDEO)
      while event = SDL::Event.poll
        @menu.draw(@screen)
        @screen.flip
        sleep 20
        puts 'in start_game()'
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
