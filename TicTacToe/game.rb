class Game
  attr_reader :board, :players

  def initialize(board)
    @board = board
    @players = []
    @current_player_index = 0
  end

  def add_player(player)
    @players << player
  end

  def over?
    #Check rows
    @board.size.times do |row|
      current_row = @board.state[row]
      if(winning_line? current_row)
        return true
      end
    end

    #Check cols
    @board.size.times do |col|
      current_col = []
      @board.size.times do |row|
         current_col << @board.state[row][col]
      end

      if(winning_line? current_col)
        return true
      end
    end

    #Check diagonals
    back_diagonal = []
    forward_diagonal = []
    @board.size.times do |x|
      back_diagonal << @board.state[x][x]
      forward_diagonal << @board.state[x][@board.size - 1 - x]
    end

    if(winning_line?(back_diagonal) || winning_line?(forward_diagonal))
      return true
    end

    #Are all the squares taken
    return @board.full?
  end

  def winning_player
    winner = nil
    @players.each do |player|
       if(player.symbol == @winning_symbol)
         winner = player
       end
    end
    return winner
  end

  def winning_line? (squares)
    if(squares.uniq.size == 1 && squares[0] != Board.Blank)
      @winning_symbol = squares[0]
      return true
    end

    return false
  end

  def next_move()
    player = @players[@current_player_index]

    player.make_move(@board)

    @current_player_index += 1
    if(@current_player_index >= @players.size)
      @current_player_index = 0 
    end
  end
end