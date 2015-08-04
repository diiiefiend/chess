class Piece
  attr_reader :color, :board
  attr_accessor :pos

   def initialize(pos, color, board)
     @pos, @color, @board = pos, color, board
   end

   def moves
   end
end
