#!/usr/bin/env ruby

require 'logger'

module JakeTheSnake
  module Helpers
    extend self

    $logfile = "./jake.log"
    $scorefile = "./highscore.txt"

    Log = Logger.new($logfile)
    Log.level = Logger::DEBUG
    Log.debug('Created logger')

    def score(points)
      unless points > 0 then points = 0 end
      $stdout.puts "\nYou scored #{points} points!"

      unless points == 0
        score_time = Time.now.strftime("%d/%m/%Y, %T")
        score = File.new($scorefile, "a")
        score.write("You scored #{points} points at #{score_time}\r\n")
        score.close
      end
    end
  end
end
