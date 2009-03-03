#!/usr/bin/env ruby

require 'logger'

# Create our own getters/setters methods for singleton classes
# by extending Module
class Module
  def sattr_reader(*syms)
    syms.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @#{sym}
          @#{sym} = nil
        end
        def self.#{sym}
          @#{sym}
        end
      EOS
    end
  end

  def sattr_writer(*syms)
    syms.each do |sym|
      class_eval(<<-EOS, __FILE__, __LINE__)
        unless defined? @#{sym}
          @#{sym} = nil
        end
        def self.#{sym}=(obj)
          @#{sym} = obj
        end
      EOS
    end
  end

  def sattr_accessor(*syms)
    sattr_reader(*syms)
    sattr_writer(*syms)
  end
end

module JakeTheSnake
  module Helpers
    extend self

    $logfile = "./jake.log"
    $scorefile = "./highscore.txt"

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
