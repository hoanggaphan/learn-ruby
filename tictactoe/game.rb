require_relative "board"
require_relative "player"

class Game
  def initialize
    @board = Board.new
    @players = [
      Player.new(ask_name("Player 1"), "X"),
      Player.new(ask_name("Player 2"), "O")
    ]
    @current_player = @players[0]
  end

  def play
    loop do
      @board.display
      take_turn
      if @board.winner?(@current_player.marker)
        @board.display
        puts "#{@current_player.name} wins!"
        break
      elsif @board.full?
        @board.display
        puts "It's a draw!"
        break
      end
      switch_player
    end
  end

  private

  def ask_name(prompt)
    print "Enter name for #{prompt}: "
    gets.chomp
  end

  def take_turn
    position = nil
    loop do
      print "#{@current_player.name} (#{@current_player.marker}), choose a position (1-9): "
      input = gets.chomp
      position = input.to_i
      break if (1..9).include?(position) && @board.place_marker(position, @current_player.marker)

      puts "Invalid move. Try again."
    end
  end

  def switch_player
    @current_player = @current_player == @players[0] ? @players[1] : @players[0]
  end
end
