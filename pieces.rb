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
    images = {:w => "\u2657", :b => "\u265D"}
    checkmark = images[color]
    checkmark.encode('utf-8')
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
    images = {:w => "\u2656", :b => "\u265C"}
    checkmark = images[color]
    checkmark.encode('utf-8')
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
    images = {:w => "\u2655", :b => "\u265B"}
    checkmark = images[color]
    checkmark.encode('utf-8')
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
    images = {:w => "\u2654", :b => "\u265A"}
    checkmark = images[color]
    checkmark.encode('utf-8')
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
    images = {:w => "\u2658", :b => "\u265E"}
    checkmark = images[color]
    checkmark.encode('utf-8')
  end
end
