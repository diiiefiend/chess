require_relative 'requires.rb'

board = Board.new
p board[[1, 1]].moves
board.render
board.move([1, 1], [2, 1])
board.render
p board[[2,1]].moves
