module JakeTheSnake
  module Helpers
    def self.debug(text)
      $time = Time.now.strftime("%T")

      @logfile = File.new("./log.txt", "a")
      @logfile.write("[#{$time}] #{text}\r\n")
      @logfile.close

      if JakeTheSnake::Verbose
        $stderr.puts "[#{$time}] #{text}"
      end
    end

    def self.score(points)
      $stdout.puts "\nYou scored #{points} points!"
      
      $score_time = Time.now.strftime("%d/%m/%Y, %T")
      $score_file = File.open("./highscore.txt", "a")
      $score_file.write("" << "You scored #{points} points at #{$score_time}\r\n")
      $score_file.close
    end
  end
end
