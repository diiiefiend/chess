require_relative 'requires.rb'
require "byebug"

class Game
  attr_reader :board, :white, :black, :current_player

  def initialize
    @board = Board.new
    @white = ComputerPlayer.new(:w, @board)
    @black = ComputerPlayer.new(:b, @board)
    @current_player = @black
  end

  def play
    system("clear")
    until over?
      switch_player
      board.render
      move_piece
      sleep(1)
      system("clear")
    end

    board.render
    puts "Congratulations #{current_player.color}!!!!!!!"
  end

  private
  def move_piece
    begin
      start_input, end_input = current_player.play_turn
      p [start_input, end_input]
      board.move(start_input, end_input, current_player.color)
    rescue MissingPieceError => e
      puts e.message
      retry
    rescue OthersPieceError => e
      puts e.message
      retry
    rescue InvalidMoveError => e
      puts e.message
      retry
    rescue CheckError => e
      puts e.message
      retry
    end
  end

  def switch_player
    (@current_player == white) ? (@current_player = black) : (@current_player = white)
  end

  def over?
    board.checkmate?(white.color) || board.checkmate?(black.color)
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
