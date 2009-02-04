#!/usr/bin/env ruby
require 'sdl'
require 'lib/game_engine'
require 'lib/menu'

class Game
  attr_accessor :state
  attr_reader :screen, :height, :width, :full_screen, :random_height, :random_width, :engine
  def initialize(height, width, full_screen)
    @screen = SDL::Screen.open(width, height, 32, SDL::SWSURFACE)
    @height = height
    @width = width
    @full_screen = full_screen
    @random_height = rand(608)
    @random_width = rand(448)
    @engine = GameEngine.new
    @menu = Menu.new
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
end

