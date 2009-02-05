#!/usr/bin/env ruby
require 'lib/colorize'

module JakeTheSnake
  class HighScore
    def initialize
    end

    def clock_tick
      $stderr.puts "Currently in: %s" % Colorize.new("red").colorize("HighScore.clock_tick()")
    end
  end
end
