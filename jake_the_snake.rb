#!/usr/bin/env ruby
require 'lib/game_engine'
require 'lib/helpers'

module JakeTheSnake
  Authors = "Jolts <johan@sharpcode.se>, Gigamo <gigamo@gmail.com>"
  License = "GPL, http://www.gnu.org/copyleft/gpl.html"
  Version = "1.0"
  Info    = "http://github.com/jolts/jakethesnakerubysdl/"

  Verbose = false

  include Helpers

  def self.run
    begin
      Helpers::debug("Starting Jake "+JakeTheSnake::Version)
      $game = GameEngine.new
      $game.init
    ensure
      Helpers::debug("JakeTheSnake exited.")
    end
  end
end

JakeTheSnake::run if $0 == __FILE__
