module JakeTheSnake
  module Helpers
    def Helpers.debug(text)
      @time = Time.now.strftime("%T")
    
      @logfile = File.new("./log.txt", "a")
      @logfile.write("[#{@time}] #{text}\r\n")
      @logfile.close
    
      $stderr.puts "[#{@time}] #{text}"
    end
  end
end
