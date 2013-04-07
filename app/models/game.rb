class Game < ActiveRecord::Base
	attr_accessible :board, :player_o, :player_x, :current_player, :status

	def initialize 
		@board = Array.new(3).map{[nil, nil, nil]}
		@player_o = 'o'
		@player_x = 'x'
	end

	def board
		@board
	end

	# This could be refactored to use @player_o and @player_x
	def assign_player_position(player, row, column)
		@board[row][column] = player
	end

    # This might not actually be necessary. In the views, we can draw a permanent grid
    # and insert the value of each cell into it.
	def display_board
    	"#{display_line(0)}" +
	  	"- - -\n" +
    	"#{display_line(1)}" +
		"- - -\n" +
    	"#{display_line(2)}"
	end

	def display_element(row, column)
		element = @board[row][column]
		if element
			element
		else
			' '
		end
	end

    def display_line(row)
   		"#{display_element(row,0)}|#{display_element(row,1)}|#{display_element(row,2)}\n"
    end
end

# board = Game.new
# board.assign_player_position('x', 0, 1)
# board.assign_player_position('o', 0, 2)
# puts board.display_board
