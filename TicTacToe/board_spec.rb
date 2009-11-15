require "spec"
require "board"

describe Board do

  it "should have at least 3 squares in size" do
    lambda {Board.new(2)}.should raise_error("The board must have an odd size of at least 3")
    lambda {Board.new(1)}.should raise_error("The board must have an odd size of at least 3")
  end

  it "should have an odd number of squares in size" do
    lambda {Board.new(6)}.should raise_error("The board must have an odd size of at least 3")
  end

  it "should not be full if no players have changed the starting state" do
    board = Board.new(3)

    board.full?.should == false
  end

  it "should not be full if some squares are still free" do
    board = Board.new(3)
    board.state[0][0] = "X"
    board.state[1][1] = "O"
    board.state[2][2] = "X"

    board.full?.should == false    
  end

  it "should be full is all squares are taken" do
    board = Board.new(3)

    board.size.times do |row|
      board.size.times do |col|
        board.state[row][col] = "X"
      end
    end

    board.full?.should == true
  end

  it "should be empty if no symbols have been placed" do
    board = Board.new(3)

    board.empty?.should == true
  end

  it "should not be empty if at least one symbol has been placed" do
    board = Board.new(3)
    board.state[0][0] = "X"

    board.empty?.should == false
  end
end