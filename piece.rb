class Piece
  attr_reader :color, :board
  attr_accessor :pos

   def initialize(pos, color, board)
     @pos, @color, @board = pos, color, board
   end

   def moves
   end

   def valid_moves(start, end_pos)
     duped_board = board.deep_dup

     valid_moves = []
     moves.each do |move|

       #debugger
       duped_board[start].pos = move
       duped_board[move] = duped_board[start]

       unless duped_board.in_check?(color)
         valid_moves << move
       end
     end

     valid_moves
   end
end
