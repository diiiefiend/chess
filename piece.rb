class Piece
  attr_reader :color, :board
  attr_accessor :pos

   def initialize(pos, color, board)
     @pos, @color, @board = pos, color, board
   end

   def dup
     copy = Piece.new(self.pos, self.color, self.board)
   end

   def moves
   end

   def valid_moves
     duped_board = board.deep_dup

     valid_moves = []
     moves.each do |move|
       next if move.nil?
       duped_piece = duped_board[pos]
       duped_piece.pos = move
       duped_board[move] = duped_piece

       unless duped_board.in_check?(color)
         valid_moves << move
       end
     end

     valid_moves
   end

   def inspect
     to_s + " " + pos.join(", ") + " " + color.to_s
   end
end
