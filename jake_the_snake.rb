#!/usr/bin/env ruby
require 'lib/game_engine'
require 'lib/helpers'

module JakeTheSnake
  Authors = "Jolts <johan@sharpcode.se>, Gigamo <gigamo@gmail.com>"
  License = "GPL, http://www.gnu.org/copyleft/gpl.html"
  Version = "1.0.2"
  Info    = "http://github.com/jolts/jakethesnakerubysdl/"

  Verbose = false

  include Helpers

  def self.run
    begin
      Helpers::debug("Jake #{JakeTheSnake::Version} started.")
      $game = GameEngine.new
      $game.init
      raise Exception
    rescue Exception => exp
      Helpers::debug("There was an unexpected error. (#{exp.message})")
    ensure
      Helpers::debug("JakeTheSnake exited.")
    end
  end
end

JakeTheSnake::run if $0 == __FILE__
