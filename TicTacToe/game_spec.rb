require "spec"
require "game"
require "board"

describe Game do
  it "should not be over if the board is empty" do
    board = Board.new(3)
    game = Game.new(board)

    game.over?.should == false
  end

  it "should identify a winning line" do
    squares = ['X', 'X', 'X']

    board = Board.new(3)
    game = Game.new(board)
    game.winning_line?(squares).should == true
  end

  it "should identify a full blocked line" do
    squares = ['X', 'O', 'X']

    board = Board.new(3)
    game = Game.new(board)
    game.winning_line?(squares).should == false
  end

  it "should identify a incomplete line" do
    squares = ['X', ' ', 'X']

    board = Board.new(3)
    game = Game.new(board)
    game.winning_line?(squares).should == false
  end

  it "should be over if a row contains only one player's symbols" do
    board = Board.new(3)
    board.state[0][0] = 'X'
    board.state[0][1] = 'X'
    board.state[0][2] = 'X'

    game = Game.new(board)

    game.over?.should == true
  end

  it "should be over if a col contains only one player's symbols" do
    board = Board.new(3)
    board.state[0][1] = 'X'
    board.state[1][1] = 'X'
    board.state[2][1] = 'X'

    game = Game.new(board)

    game.over?.should == true
  end

  it "should be over if the back diaganol contains only one player's symbols" do
    board = Board.new(3)
    board.state[0][0] = 'X'
    board.state[1][1] = 'X'
    board.state[2][2] = 'X'

    game = Game.new(board)

    game.over?.should == true
  end

  it "should be over if the forward diaganol contains only one player's symbols" do
    board = Board.new(3)
    board.state[0][2] = 'X'
    board.state[1][1] = 'X'
    board.state[2][0] = 'X'

    game = Game.new(board)

    game.over?.should == true
  end
end