class SlidingPiece < Piece
  DIAGONAL_DELTA = [
    [-1, 1],
    [1, 1],
    [1,-1],
    [-1,-1]
  ]
  LATERAL_DELTA = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  def initialize(pos, color, board, move_direction)
    super(pos, color, board)
    @move_direction = move_direction
  end

  def move_dirs

  end

  def moves

  end
end
