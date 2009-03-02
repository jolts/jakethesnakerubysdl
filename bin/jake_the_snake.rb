#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/game_engine'

begin
  $logger.info('Started Jake')
  trap(:INT) { $logger.fatal("Caught #{:INT}, exiting") }
  $game = JakeTheSnake::GameEngine.new
  $game.init if $0 == __FILE__
end
