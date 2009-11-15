require "player"

class ComputerPlayer < Player
  def make_move(board)
    #If the board is empty, play the centre square first
    if board.empty?
      centre = (board.size / 2.0).floor
      board.place_symbol(@symbol, centre, centre)
      return
    end

    #Get the empty squares ready for profiling
    empty_squares = board.empty_squares

    #Score each empty square for winning or blocking
    empty_squares.each do |square|
      #Process the row for this square
      current_row = board.state[square.x]
      process_line current_row, square, board

      #Process the col for this square
      current_col = []
      board.size.times do |row|
         current_col << board.state[row][square.y]
      end
      process_line current_col, square, board

      #Process the back diagonal (if this square is part of it)
      if(square.x == square.y)
        back_diagonal = []
        board.size.times do |x|
          back_diagonal << board.state[x][x]
        end
        process_line back_diagonal, square, board
      end

      #Process the forward diagonal (if this square is part of it)
      if(square.y == board.size - 1 - square.x)
        forward_diagonal = []
        board.size.times do |x|
          forward_diagonal << board.state[x][board.size - 1 - x]
        end
        process_line forward_diagonal, square, board
      end
    end

    #Sort the empty squares by their score and play the highest scored
    #square. If there is more than one, play a random one.
    empty_squares.sort! { |a, b| b.score <=> a.score }

    candidate_squares = []
    top_score = empty_squares[0].score
    empty_squares.each do |square|
      if(square.score == top_score)
        candidate_squares << square
      end
    end

    square_to_play = candidate_squares[rand(candidate_squares.size)]
    board.place_symbol(@symbol, square_to_play.x, square_to_play.y)
  end

  def process_line(line, square, board)
    friends = 0
    opponents = 0
    line.each do |symbol|
      if(symbol == @symbol) then friends += 1 end
      if(symbol != @symbol && symbol != Board.Blank) then opponents += 1 end
    end

    if(friends == board.size - 1)
      #This is a winning line so score highly
      square.score += 100
    end

    if(opponents == board.size - 1)
      #This is a line that needs blocking so place symbol
      square.score += 25
    end

    #There is not an obvious move in this line so score the blank square
    square.score += friends - opponents
  end

  private :process_line
end