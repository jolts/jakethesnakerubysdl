#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/game_engine'

begin
  $logger.info('Started Jake')
  $game = JakeTheSnake::GameEngine.new
  $game.init if $0 == __FILE__
rescue => err
  $logger.fatal('Caught Exception, exiting')
  $logger.fatal(err)
end
