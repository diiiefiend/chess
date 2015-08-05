require_relative 'pieces.rb'
require_relative 'pawn.rb'
require 'colorize'

class Board
  BOARD_SIZE = 8
  OPENING_ROW = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
  attr_reader :grid
  attr_accessor :graveyard

  def initialize
    @grid = Array.new(BOARD_SIZE) {Array.new(BOARD_SIZE)}
    populate_grid(:w)
    populate_grid(:b)
    @graveyard = []
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
    puts "  0 1 2 3 4 5 6 7"
    grid.each_with_index do |row, idx|
      print "#{idx} "
      row.each_with_index do |tile, idy|
        bg_color = ((idx + idy).even? ? :light_white : :light_yellow)
        output = tile.nil? ? "  " : tile.to_s + " "
        print output.colorize(:background => bg_color)
        # tile.nil? ? (print "  ".colorize(:background => bg_color)) : (print tile.to_s + " ".colorize(:background => bg_color))
      end
      print "\n"
    end
    print "\n\n"

    w = graveyard.select{|piece| piece.color == :b}
    b = graveyard.select{|piece| piece.color == :w}
    puts "white: #{w.each(&:to_s)}"
    puts "black: #{b.each(&:to_s)}"
  end

  def move(start, end_pos, color)
    current_piece = self[start]

    check_for_errors(current_piece, end_pos, color)
    @graveyard << self[end_pos] if !self[end_pos].nil?

    test_move(start, end_pos)
  end

  def test_move(start_pos, end_pos)
    piece = self[start_pos]
    piece.pos = end_pos
    self[end_pos] = piece
    self[start_pos] = nil
  end

  def in_check?(color)
    total_moves = []

    all_pieces(switch_color(color)).each do |enemy_piece|
      total_moves += enemy_piece.moves
    end

    total_moves.include?(king_index(color))
  end

  def checkmate?(color)
    in_check?(color) &&
      all_pieces(color).all?{ |piece| piece.valid_moves.empty? }
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

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0, BOARD_SIZE - 1)}
  end

  private
  def populate_grid(color)
    if color == :b
      rows = [1, 0]
    else
      rows = [6, 7]
    end
    place_pawns(rows[0], color)
    place_special_pieces(rows[1], color)
  end

  def place_pawns(row, color)
    grid[row].each_with_index do |tile, col|
      self[[row, col]] = Pawn.new([row, col], color, self)
    end
  end

  def place_special_pieces(row, color)
    grid[row].each_with_index do |tile, col|
      self[[row, col]] = OPENING_ROW[col].new([row, col], color, self)
    end
  end

  def all_pieces(color)
    grid.flatten.select {|piece| !piece.nil? && piece.color == color}
  end

  def king_index(color)
    idx = grid.flatten.index {|piece| piece.is_a?(King) && piece.color == color}
    row, col = (idx / BOARD_SIZE), (idx % BOARD_SIZE)
    [row, col]
  end

  def switch_color(color)
    color == :w ? :b : :w
  end

  def check_for_errors(current_piece, end_pos, color)
    if current_piece.nil?
      raise MissingPieceError.new ("There is no piece there?!!")
    end

    unless current_piece.color == color
      raise OthersPieceError.new ("Not your piece...")
    end

    unless current_piece.moves.include?(end_pos)
      raise InvalidMoveError.new ("You can't move there!!!")
    end

    unless current_piece.valid_moves.include?(end_pos)
      raise CheckError.new ("You will get checked!!!")
    end
  end
end

class MissingPieceError < StandardError
end

class OthersPieceError < StandardError
end

class InvalidMoveError < StandardError
end

class CheckError < StandardError
end
