require_relative "sliding.rb"
require_relative "stepping.rb"

class Bishop < SlidingPiece
  def initialize(pos, color, board, move_direction)
    super
    @move_direction = :d
  end

  def move_dirs
  end

  def moves
  end
end

class Rook < SlidingPiece
  def initialize(pos, color, board, move_direction)
    super
    @move_direction = :l
  end
end

class Queen < SlidingPiece
  def initialize(pos, color, board, move_direction)
    super
    @move_direction = :q
  end
end

class King < SteppingPiece
  def initialize(pos, color, board, move_direction)
    super
    @move_direction = :k
  end
end

class Knight < SteppingPiece
  def initialize(pos, color, board, move_direction)
    super
    @move_direction = :h
  end
end
