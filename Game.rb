#!/usr/bin/env ruby
require 'sdl'
require 'gameengine'

class Menu
  def initialize
    @@choice = 1
    @@choice_y = 176
  end

  def draw(surface)
    puts 'in draw()'
    menu_screen = load_image("background_and_wall_menu.bmp")
    apple = load_image("apple_menu.bmp")
    SDL::Surface.blit($screen, 0, 0, 0, 0, menu_screen, 0, 0)
    SDL::Surface.blit($screen, 0, 0,0,0, apple, 168, 176)
  end
end

class Game
  attr_accessor :state
  attr_reader :screen, :height, :width, :full_screen, :random_height, :random_width, :engine
  def initialize(height, width, full_screen)
    $screen = SDL.setVideoMode(640, 480, 16, SDL::SWSURFACE)
    @height = height
    @width = width
    @full_screen = full_screen
    @random_height = rand(608)
    @random_width = rand(448)
    @engine = GameEngine.new($screen)
    @state = Menu.new
    @engine.start_game
  end
end

begin
  Game.new(640, 480, false)
end

