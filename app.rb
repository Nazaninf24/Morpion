
require 'bundler'
Bundler.require

require_relative 'lib/player'
require_relative 'lib/board'
require_relative 'lib/game'


test1 = Game.new
test1.get_team

test1 = Board.new
test1.play