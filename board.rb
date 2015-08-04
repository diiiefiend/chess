require_relative 'pieces.rb'
require_relative 'pawn.rb'

class Board
  BOARD_SIZE = 8
  OPENING_ROW = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
  attr_reader :grid

  def initialize
    @grid = Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
    populate_grid(:w)
    populate_grid(:b)
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0, BOARD_SIZE - 1)}
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    grid[x][y] = piece
  end

  def render
    puts "   0 1 2 3 4 5 6 7"
    puts "   ---------------"
    grid.each_with_index do |row, idx|
      print "#{idx}: "
      row.each do |tile|
        tile.nil? ? (print "_ ") : (print tile.to_s + " ")
      end
      print "\n"
    end
    print "\n\n"
  end

  def occupied?(pos)
    !self[pos].nil?
  end

  def occupied_by_team?(pos, color)
    occupied?(pos) && self[pos].color == color
  end

  def capturable?(target_pos, color)
    occupied?(target_pos) && self[target_pos].color != color
  end

  def move(start, end_pos)
    if self[start].nil?
      raise MissingPieceError.new ("There is no piece there?!!")
    end

    unless self[start].moves.include?(end_pos)
      raise InvalidMoveError.new ("You can't move there!!!")
    end

    self[start].pos = end_pos
    self[end_pos] = self[start]
    self[start] = nil
  end

  private
  def populate_grid(color)
    if color == :b
      rows = [1, 0]
    else
      rows = [6, 7]
    end

    #place pawns
    grid[rows[0]].each_with_index do |tile, col|
      self[[rows[0], col]] = Pawn.new([rows[0], col], color, self)
    end

    #place special pieces
    grid[rows[1]].each_with_index do |tile, col|
      self[[rows[1], col]] = OPENING_ROW[col].new([rows[1], col], color, self)
    end

  end
end

class MissingPieceError < StandardError
end

class InvalidMoveError < StandardError
end
