#!/usr/bin/env ruby
require File.dirname(__FILE__) + '/../lib/game_engine'

$game = JakeTheSnake::GameEngine.new
$game.init if $0 == __FILE__