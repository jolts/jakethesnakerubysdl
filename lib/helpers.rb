module JakeTheSnake
  module Helpers
    extend self

    Verbose = false

    LogFile = "./log.txt"
    ScoreFile = "./highscore.txt"

    def self.debug(text)
      time = Time.now.strftime("%T")

      log = File.new(LogFile, "a")
      log.write("" << "[#{time}] #{text}\r\n")
      log.close

      if JakeTheSnake::Verbose
        $stderr.puts "[#{time}] #{text}"
      end
    end

    def self.score(points)
      unless points > 0: points = 0 end

      $stdout.puts "\nYou scored #{points} points!"

      score_time = Time.now.strftime("%d/%m/%Y, %T")
      score = File.new(ScoreFile, "a")
      score.write("" << "You scored #{points} points at #{score_time}\r\n")
      score.close
    end
  end
end
