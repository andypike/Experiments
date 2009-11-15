require "board"
require "computer_player"
require "human_player"
require "game"

class TicTacToe
  def run()
    board = Board.new(3)
    player1 = HumanPlayer.new("O", "Player 1")
    player2 = ComputerPlayer.new("X", "Player 2")

    game = Game.new(board)
    game.add_player player1
    game.add_player player2

    until game.over? do
      board.draw
      puts "\n\n\n"
      game.next_move
    end

    puts "\n\nGame Over!\n\n"
    board.draw

    if(game.winning_player)
      puts "\n\nThe winner is #{game.winning_player.name}"
    else
      puts "\n\nIt's a draw"
    end
  end
end

game = TicTacToe.new
game.run