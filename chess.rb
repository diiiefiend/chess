require_relative 'requires.rb'
require "byebug"

board = Board.new

p board[[1, 1]].moves
board.render
board.move([1, 1], [2, 1])
board.render
p board[[2,1]].moves
board.move([0, 1], [2, 0])
board.render
board.move([0, 2], [1, 1])
board.render
#debugger
p board[[2,0]].moves
board.move([2, 0], [4, 1])
board.render
board.move([4, 1], [6, 0])
board.render
