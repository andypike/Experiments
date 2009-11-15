require "player"

class HumanPlayer < Player
   def make_move(board)
     move_required = true

     while move_required do
       print "Enter the zero-base row index: "
       row_index = gets.chomp.to_i

       print "Enter the zero-base col index: "
       col_index = gets.chomp.to_i

       begin
          board.place_symbol(@symbol, row_index, col_index)
          move_required = false
       rescue
         puts "That square is taken, please try another"
          move_required = true
       end
       
     end
   end
end