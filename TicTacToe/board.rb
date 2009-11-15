require "square"

class Board
  attr_reader :size, :state, :blank_char

  def self.Blank
    return ' '
  end

  def initialize(size = 3)
    if(size < 3 || size % 2 == 0)
      raise "The board must have an odd size of at least 3"
    end

    @size = size
    @state = Array.new(@size) { Array.new(@size) {Board.Blank} }
  end

  def draw()
    @size.times do |row|
      @size.times do |col|
        print "#{@state[row][col]}"
        if(col < @size - 1)
          print "|"
        end
      end

      if(row < @size - 1)
        puts
        ((@size * 2) - 1).times { print "-" }
        puts
      end
    end
  end

  def full?()
    @size.times do |row|
      @size.times do |col|
         if(@state[row][col] == Board.Blank)
           return false
         end
      end
    end

    return true
  end

  def empty?()
    @size.times do |row|
      @size.times do |col|
         if(@state[row][col] != Board.Blank)
           return false
         end
      end
    end

    return true
  end

  def place_symbol(symbol, row, col)
    if(@state[row][col] != Board.Blank)
      raise "Unable to place symbol '#{symbol}' at location (#{row}, #{col}) as it already has a symbol (#{@state[row][col]}). This is an illegal move."
    end

    @state[row][col] = symbol
  end

  def empty_squares()
    empty_squares = []
    @size.times do |row|
      @size.times do |col|
         if(@state[row][col] == Board.Blank)
           empty_squares << Square.new(row, col)
         end
      end
    end
    return empty_squares
  end
end