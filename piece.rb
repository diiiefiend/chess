require "byebug"

class Piece
  PIECE_IMAGES = {
    "Bishop" => ["\u2657", "\u265D"],
    "Rook" => ["\u2656", "\u265C"],
    "Queen" => ["\u2655", "\u265B"],
    "King" => ["\u2654", "\u265A"],
    "Knight" => ["\u2658", "\u265E"],
    "Pawn" => ["\u2659", "\u265F"],
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

  def to_s
    idx = (color == :w ? 0 : 1)
    checkmark = PIECE_IMAGES[self.class.to_s][idx].encode('utf-8')
  end

  def to_sym

  end
end
