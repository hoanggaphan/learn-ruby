class Board
  WINNING_COMBOS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ].freeze

  def initialize
    @cells = Array.new(9, " ")
  end

  def display
    puts ""
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "---+---+---"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "---+---+---"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
    puts ""
  end

  def place_marker(position, marker)
    index = position - 1
    return false if @cells[index] != " "

    @cells[index] = marker
    true
  end

  def winner?(marker)
    WINNING_COMBOS.any? do |combo|
      combo.all? { |i| @cells[i] == marker }
    end
  end

  def full?
    @cells.none? { |cell| cell == " " }
  end
end
