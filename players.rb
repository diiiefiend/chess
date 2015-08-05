class HumanPlayer
  attr_reader :color

  def initialize(color)
    @color = color
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
      input = gets.chomp.split(",").map(&:to_i)
      raise InvalidInputError.new ("L2R yo") unless valid?(input)
    rescue InvalidInputError => e
      puts e.message
      retry
    end
    
    input
  end

  def valid?(input)
     input.length == 2
  end
end

class InvalidInputError < StandardError
end
