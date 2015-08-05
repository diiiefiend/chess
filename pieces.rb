require_relative 'stepping.rb'
require_relative 'sliding.rb'

class Bishop < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :bishop)
  end

  def move_dirs
    DIAGONAL_DELTA
  end

  def to_s
    idx = (color == :w ? 0 : 1)
    checkmark = PIECE_IMAGES[:bishop][idx].encode('utf-8')
  end

end

class Rook < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :rook)
  end

  def move_dirs
    LATERAL_DELTA
  end

  def to_s
    idx = (color == :w ? 0 : 1)
    checkmark = PIECE_IMAGES[:rook][idx].encode('utf-8')
  end
end

class Queen < SlidingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :queen)
  end

  def move_dirs
    LATERAL_DELTA + DIAGONAL_DELTA
  end

  def to_s
    idx = (color == :w ? 0 : 1)
    PIECE_IMAGES[:queen][idx].encode('utf-8')
  end
end

class King < SteppingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :king)
  end

  def move_dirs
    KING_DELTA
  end

  def to_s
    idx = (color == :w ? 0 : 1)
    checkmark = PIECE_IMAGES[:king][idx].encode('utf-8')
  end
end

class Knight < SteppingPiece
  def initialize(pos, color, board)
    super(pos, color, board, :knight)
  end

  def move_dirs
    KNIGHT_DELTA
  end

  def to_s
    idx = (color == :w ? 0 : 1)
    checkmark = PIECE_IMAGES[:knight][idx].encode('utf-8')
  end
end
