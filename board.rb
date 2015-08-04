class Board
  BOARD_SIZE = 8
  attr_reader :grid

  def initialize
    @grid = grid
  end

  def in_bounds?(pos)
    pos.all? { |coord| coord.between?(0, BOARD_SIZE - 1)}
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def occupied?(pos)
    !self[pos].nil?
  end

  def occupied_by_team?(pos, color)
    occupied?(pos) && board[pos].color == color
  end
end
