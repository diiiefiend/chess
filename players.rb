class HumanPlayer
  attr_reader :color, :board

  def initialize(color, board)
    @color, @board = color, board
  end

  def play_turn
    puts "Enter starting input #{color}"
    start_input = get_input
    puts "Enter destination input #{color}"
    end_input = get_input

    [start_input, end_input]
  end

  def get_input
    begin
      puts "Which piece do you want to move? (format: x,y)"
      input = gets.chomp.split(",")
      raise InvalidInputError.new ("L2R yo") unless valid?(input)
    rescue InvalidInputError => e
      puts e.message
      retry
    end

    input.map(&:to_i)
  end

  def valid?(input)
     input.length == 2 && is_int?(input)
  end

  def is_int?(input)
    input.all? {|num| num.ord.between?("0".ord, "8".ord)}
  end
end

class ComputerPlayer
  attr_reader :color, :board

  def initialize(color, board)
    @color, @board = color, board
  end

  def play_turn
    best_move
  end

  def all_valid_moves
    moves = {}

    pieces = board.all_pieces(color)
    pieces.each do |piece|
      v_moves = piece.valid_moves
      moves[piece] = v_moves unless v_moves.empty?
    end

    moves
  end

  def best_move
    all_moves = all_valid_moves
    moves = []
    possible_end_points = all_moves.values.flatten.each_slice(2).to_a
    possible_end_points.each do |move|
      moves << move if board.capturable?(move, color)
    end

    if moves.empty?
      piece = all_moves.keys.sample

      start_input = piece.pos
      end_input = all_moves[piece].sample
    else
      end_input = moves.sample
      start_input = all_moves.select do |k, v|
        v.include?(end_input)
      end.keys.first.pos
    end

    [start_input, end_input]
  end
end

class InvalidInputError < StandardError
end
