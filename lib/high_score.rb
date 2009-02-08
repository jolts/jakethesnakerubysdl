#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/helpers'
require 'lib/menu'

module JakeTheSnake
  class HighScore
    include Sprite
    include Helpers

    def initialize
      @highscore_list = "high_score.txt"
      @file = File.open(@highscore_list, 'a+')
    end

    def write(score)
      @file.write(score.to_s)
      @file.close
    end

    def present
      @file = File.open(@highscore_list)
      puts '|-- High Score --|'
      @file.each_line do |line|
        puts line
      end
    end
  end
end
