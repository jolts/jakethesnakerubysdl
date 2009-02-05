#!/usr/bin/env ruby
require 'lib/sprite'
require 'lib/snake'

module JakeTheSnake
  class NewGame < Sprite
    def initialize
      @snake = Snake.new
    end
  end
end
