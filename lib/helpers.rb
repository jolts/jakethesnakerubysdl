module JakeTheSnake
  module Helpers
    def self.debug(text)
      $time = Time.now.strftime("%T")

      @logfile = File.new("./log.txt", "a")
      @logfile.write("[#{$time}] #{text}\r\n")
      @logfile.close

      if JakeTheSnake::VERBOSE
        $stderr.puts "[#{$time}] #{text}"
      end
    end
  end
end
