#!/usr/bin/env ruby

require 'logger'

module JakeTheSnake
  module Helpers
    extend self

    $logfile = "./jake.log"
    $scorefile = "./highscore.txt"

    $logger = Logger.new($logfile)
    #$logger = Logger.new(STDOUT)
    $logger.level = Logger::DEBUG
    $logger.debug('Created logger')

    def self.score(points)
      unless points > 0: points = 0 end
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
