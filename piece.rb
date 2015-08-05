class Piece
  PIECE_IMAGES = {
    :bishop => ["\u2657", "\u265D"],
    :rook => ["\u2656", "\u265C"],
    :queen => ["\u2655", "\u265B"],
    :king => ["\u2654", "\u265A"],
    :knight => ["\u2658", "\u265E"],
    :pawn => ["\u2659", "\u265F"],
  }

  attr_reader :color, :board
  attr_accessor :pos

  def initialize(pos, color, board)
    @pos, @color, @board = pos, color, board
  end

  def valid_moves
    starting_pos = pos
    valid_moves = []

    moves.each do |move|
      piece = board[move]
      board.test_move(starting_pos, move)

      unless board.in_check?(color)
        valid_moves << move
      end

      board.test_move(move, starting_pos)
      board[move] = piece
    end

    valid_moves
  end

  def inspect
   to_s + " " + pos.join(", ") + " " + color.to_s
  end
end
