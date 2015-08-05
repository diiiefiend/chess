class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(pos, color, board)
    @pos, @color, @board = pos, color, board
  end

  def valid_moves
    starting_pos = pos
    valid_moves = []

    moves.each do |move|
      piece = board[starting_pos]
      board.test_move(starting_pos, move)

      unless board.in_check?(color)
        valid_moves << move
      end

      board.test_move(move, starting_pos)
    end

    valid_moves
  end

  def inspect
   to_s + " " + pos.join(", ") + " " + color.to_s
  end
end
