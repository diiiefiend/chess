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
    moves = all_valid_moves
    piece = moves.keys.sample

    start_input = piece.pos
    end_input = moves[piece].sample

    p [start_input, end_input]
    [start_input, end_input]
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
end

class InvalidInputError < StandardError
end
