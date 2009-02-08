#!/usr/bin/env ruby
# TODO:
#   * Edit menu image to exclude MultiPlayer (won't be having this functionality)
#   * Add collision detection for snake(self), snake(wall), and other sprites
#   * Spawn apples, carrots and ghosts
#   * Track points
#   * Add HighScores
#   * Add/Remove snake_parts gets triggered on events

require 'lib/game_engine'
require 'lib/helpers'

module JakeTheSnake
  include Helpers

  def self.run
    begin
      Helpers.debug("Starting Jake")
      $game = GameEngine.new
      $game.start_game
    ensure
      Helpers.debug("JakeTheSnake exited.")
    end
  end
end

JakeTheSnake::run if $0 == __FILE__
