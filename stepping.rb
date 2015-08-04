require_relative "piece.rb"

class SteppingPiece < Piece
  attr_reader :move_direction, :board
  HORSE_MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
  ]

  KING_MOVES = [
    [-1, -1],
    [-1,  0],
    [-1,  1],
    [ 0, -1],
    [ 0,  1],
    [ 1, -1],
    [ 1,  0],
    [ 1,  1]
  ]

  #move_direction values: :h, :k
  def initialize(pos, color, board, move_direction)
    super(pos, color, board)
    @move_direction = move_direction
  end

  def move_dirs
    case move_direction
    when :h                  #horse
      HORSE_MOVES
    when :k                   #king
      KING_MOVES
    #else                      #pawn
    #  LATERAL_DELTA + DIAGONAL_DELTA
    end
  end

  def moves
    moves = []
    x, y = pos
    move_dirs.each do |(dx, dy)|
      new_pos = [x + dx, y + dy]
      if board.in_bounds?(new_pos) && !board.occupied_by_team?(new_pos, color)
        moves << new_pos
        new_pos = [x + dx, y + dy]
      end
    end

    moves
  end
end
