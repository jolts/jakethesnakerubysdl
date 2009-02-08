#!/usr/bin/env ruby
# TODO:
#   * Edit menu image to exclude MultiPlayer (won't be having this functionality)
#   * Add collision detection for snake(self), and other sprites
#   * Spawn carrots and ghosts
#   * Track points
#   * Add HighScores
#   * Add/Remove snake_parts gets triggered on events

require 'lib/game_engine'
require 'lib/helpers'

module JakeTheSnake
  VERSION = "0.01a"
  DEBUG = false
  
  include Helpers

  def self.run
    begin
      Helpers.debug("Starting Jake "+JakeTheSnake::VERSION)
      $game = GameEngine.new
      $game.spawn_menu
    ensure
      Helpers.debug("JakeTheSnake exited.")
    end
  end
end

JakeTheSnake::run if $0 == __FILE__
