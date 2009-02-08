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
  AUTHORS = "Jolts <johan@sharpcode.se>, Gigamo <gigamo@gmail.com>"
  LICENSE = "GPL, http://www.gnu.org/copyleft/gpl.html"
  VERSION = "0.01a"
  INFO    = "http://github.com/jolts/jakethesnakerubysdl/"

  VERBOSE = true

  include Helpers

  def self.run
    begin
      Helpers::debug("Starting Jake "+JakeTheSnake::VERSION)
      $game = GameEngine.new
      $game.spawn_menu
    ensure
      Helpers::debug("JakeTheSnake exited.")
    end
  end
end

JakeTheSnake::run if $0 == __FILE__
