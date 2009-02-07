#!/usr/bin/env ruby
# TODO:
#   * Edit menu image to exclude MultiPlayer (won't be having this functionality)
#   * Add collision detection for snake(self), snake(wall), and other sprites
#   * Spawn apples, carrots and ghosts
#   * Track points
#   * Add HighScores
#   * Add/Remove snake_parts gets triggered on events

require 'lib/game_engine'

module JakeTheSnake
  begin
    $game = GameEngine.new
    $game.start_game
  ensure
    $stderr.puts "Thanks for playing Jake The Snake."
  end
end