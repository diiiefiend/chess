class Piece
  attr_reader :color, :board
  attr_accessor :pos

   def initialize(pos, color, board)
     @pos, @color, @board = pos, color, board
   end

   def moves
   end

    def valid_moves
      starting_pos = pos

      valid_moves = []
      moves.each do |move|
        piece = board[starting_pos]
        piece.pos = move
        board[move] = piece
        board[starting_pos] = nil
        
        unless board.in_check?(color)
          valid_moves << move
        end

        piece.pos = starting_pos
        board[starting_pos] = piece
        board[move] = nil
      end

      valid_moves
    end

   def inspect
     to_s + " " + pos.join(", ") + " " + color.to_s
   end
end
