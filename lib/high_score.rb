#!/usr/bin/env ruby
require 'lib/util'

module JakeTheSnake
  class HighScore
    def initialize
    end

    def clock_tick
      $stderr.puts "Currently in: %s" % Util.new("red").colorize("HighScore.clock_tick()")
    end
  end
end
