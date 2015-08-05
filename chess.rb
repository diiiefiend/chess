require_relative 'requires.rb'
require "byebug"

board = Board.new
p board
board.move([6,5],[5,5])
board.render
p board
board.move([1,4],[3,4])
board.render
p board
board.move([6,6],[4,6])
board.render
p board
p board.checkmate?(:w)
board.move([0,3],[4,7])
board.render
p board
x = board.deep_dup
puts "DUPED BOARD: "
x.render
p x
x.move([6,0],[5,0])
x.render
debugger
p board.checkmate?(:w)



# board.move([7,4],[6,5])
# board.render
# board.move([6,5],[6,6])
# board.render
# board.move([0,3],[4,7])
# board.render
# p board.in_check?(:w)
# board.move([6,6],[6,5])
# board.render
# p board.in_check?(:w)
