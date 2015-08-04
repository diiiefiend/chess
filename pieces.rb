require_relative "sliding.rb"
require_relative "stepping.rb"

class Bishop < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :bishop)
  end

  def move_dirs
    DIAGONAL_DELTA
  end
end

class Rook < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :rook)
  end

  def move_dirs
    LATERAL_DELTA
  end
end

class Queen < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :queen)
  end

  def move_dirs
    LATERAL_DELTA + DIAGONAL_DELTA
  end
end

class King < SteppingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :king)
  end

  def move_dirs
    KING_DELTA
  end
end

class Knight < SteppingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :knight)
  end

  def move_dirs
    KNIGHT_DELTA
  end
end
