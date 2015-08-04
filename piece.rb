require_relative "board.rb"

class Piece
  attr_reader :pos, :color, :board

   def initialize(pos, color, board)
     @pos, @color, @board = pos, color, board
   end

   def moves
   end
end
