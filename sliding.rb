require_relative 'piece.rb'

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
  attr_reader :move_direction, :board

  def initialize(pos, color, board, move_direction)
    super(pos, color, board)
    @move_direction = move_direction
  end

  def moves
    moves = []
    x, y = pos

    move_dirs.each do |(dx, dy)|
      new_pos = [x+dx, y+dy]
      d_multi = 1
      until !board.in_bounds?(new_pos) ||
        board.occupied_by_team?(new_pos, color)

        moves << new_pos
        d_multi += 1
        new_pos = [x+(dx * d_multi), y+(dy * d_multi)]
      end
    end

    moves
  end
end
