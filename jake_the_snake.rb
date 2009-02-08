#!/usr/bin/env ruby
# TODO:
#   * Spawn carrots and ghosts
#   * Track points
#   * Add HighScores
#   * Add/Remove snake_parts gets triggered on events

require 'lib/game_engine'
require 'lib/helpers'

module JakeTheSnake
  Authors = "Jolts <johan@sharpcode.se>, Gigamo <gigamo@gmail.com>"
  License = "GPL, http://www.gnu.org/copyleft/gpl.html"
  Version = "0.01a"
  Info    = "http://github.com/jolts/jakethesnakerubysdl/"

  Verbose = true

  include Helpers

  def self.run
    begin
      Helpers::debug("Starting Jake "+JakeTheSnake::Version)
      $game = GameEngine.new
      $game.spawn_menu
    ensure
      Helpers::debug("JakeTheSnake exited.")
    end
  end
end

JakeTheSnake::run if $0 == __FILE__
