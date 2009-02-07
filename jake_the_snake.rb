#!/usr/bin/env ruby
require 'lib/game_engine'

module JakeTheSnake
  begin
    $game = GameEngine.new
    $game.start_game
  end
end
