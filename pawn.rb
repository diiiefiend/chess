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
    move_dirs.each_with_index do |(dx, dy), idx|
      new_pos = [x + dx, y + dy]
      case idx
      when 0       #standard one space forward move
        if board.in_bounds?(new_pos) && !board.occupied?(new_pos)
          moves << new_pos
        end
        double_move = [x + 2*dx, y]
        moves <<  double_move if move_count == 0 && !board.occupied?(double_move)
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
