class SlidingPiece < Piece
  DIAGONAL_DELTA = [
    [-1, 1],
    [1, 1],
    [1, -1],
    [-1, -1]
  ]
  LATERAL_DELTA = [
    [1, 0],
    [-1, 0],
    [0, 1],
    [0, -1]
  ]

  attr_reader :move_direction

  #move_direction values: :l, :d
  def initialize(pos, color, board, move_direction)
    super(pos, color, board)
    @move_direction = move_direction
  end

  def move_dirs
    direction_arr = case move_direction
    when :l                   #rook
      LATERAL_DELTA
    when :d                   #bishop
      DIAGONAL_DELTA
    else                      #queen
      LATERAL_DELTA + DIAGONAL_DELTA
    end

    directions = []
    x, y = pos
    direction_arr.each do |(dx, dy)|
      new_pos = [x+dx, y+dy]
      d_multi = 1
      until !board.in_bounds?(new_pos)
        directions << new_pos
        d_multi += 1
        new_pos = [x+(dx * d_multi), y+(dy * d_multi)]
      end
    end

    directions
  end

  def moves

  end
end
