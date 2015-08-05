require_relative 'requires.rb'
require "byebug"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
    @current_player = :w
  end

  def play
    until over?
      board.render
      puts "Enter starting input #{current_player}"
      start_input = get_input
      puts "Enter destination input #{current_player}"
      end_input = get_input
      board.move(start_input, end_input)
      switch_player
    end

    board.render
    puts "Congratulations #{switch_player}!!!!!!!"
  end

  def switch_player
    (@current_player == :w) ? :b : :w
  end

  def over?
    board.checkmate?(:w) || board.checkmate?(:b)
  end

  def get_input
    puts "Which piece do you want to move? (format: x,y)"
    gets.chomp.split(",").map(&:to_i)
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
