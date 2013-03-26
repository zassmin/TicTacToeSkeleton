# board.rb

class Board
	attr_accessor :board

	def initialize 
		@board = [[nil, nil, nil], 
				  [nil, nil, nil], 
				  [nil, nil, nil]]
	end

	def assign_player_position(player, row, column)
		@board[row][column] = player
	end

	def display_board
		"#{display_element(0,0)}|#{display_element(0,1)}|#{display_element(0,2)}\n" +
	    "- - -\n" +
		"#{display_element(1,0)}|#{display_element(1,1)}|#{display_element(1,2)}\n" +
		"- - -\n" +
		"#{display_element(2,0)}|#{display_element(2,1)}|#{display_element(2,2)}\n"
	end

	def display_element(row, column)
		element = @board[row][column]
		if element
			element
		else
			' '
		end
	end

end