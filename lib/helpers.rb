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
      $stdout.puts "|-- Score: --|"
      $stdout.puts "#{points}"
    end
  end
end
