#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/helpers'

module JakeTheSnake
  class HighScore
    include Sprite
    include Helpers

    def initialize
    end

    def key_pressed(key)
    end

    def clock_tick
    end

    def draw(surface)
      Helpers.debug("In HighScore.draw")
    end
  end
end
