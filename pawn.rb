require_relative 'piece.rb'
require 'byebug'

class Pawn < Piece

  PAWN_MOVES_BLACK = [
    [ 1,  0],
    [ 1, -1],
    [ 1,  1]
  ]

  PAWN_MOVES_WHITE = [
    [-1,  0],
    [-1, -1],
    [-1,  1]
  ]

  attr_reader :move_count

  def initialize(pos, color, board)
    super
    @move_count = 0
  end

  def move_dirs
    color == :w ? PAWN_MOVES_WHITE : PAWN_MOVES_BLACK
  end

  def moves
    moves = []
    x, y = pos
    # deltas = movedirs
    # fwd_pos = [x+deltas[0][0], y+deltas[0][1]]
    # moves << fwd_pos if board.in_bounds?(fwd_pos) &&
    #   !board.occupied_by_team?(fwd_pos, color)
    #
    move_dirs.each_with_index do |(dx, dy), idx|
      #debugger
      new_pos = [x + dx, y + dy]
      case idx
      when 0       #standard one space forward move
        if board.in_bounds?(new_pos) && !board.occupied_by_team?(new_pos, color)
          moves << new_pos
        end
        moves << [x + 2*dx, y] if move_count == 0
      when 1, 2
        moves << new_pos if board.capturable?(new_pos, color)
      end
    end

    moves
  end

  def to_s
    images = {:w => "\u2659", :b => "\u265F"}
    checkmark = images[color]
    checkmark.encode('utf-8')
  end
end
