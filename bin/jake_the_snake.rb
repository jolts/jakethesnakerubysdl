#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/game_engine'

begin
  Log = Logger.new($logfile)
  Log.level = Logger::DEBUG
  Log.debug('Created logger')

  Log.info('Started Jake')
  trap('SIGINT') { Log.fatal("Caught SIGINT, exiting") }
  $game = JakeTheSnake::GameEngine.new
  $game.init(80) if $0 == __FILE__
end
