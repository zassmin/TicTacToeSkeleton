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

  # This might not actually be necessary. In the views, we can draw a permanent grid
  # and insert the value of each cell into it.
	def display_board
    display_line(0) +
	  "- - -\n" +
    display_line(1) +
		"- - -\n" +
    display_line(2)
	end

	def display_element(row, column)
		element = @board[row][column]
		if element
			element
		else
			' '
		end
	end

  def display_line(num)
		"#{display_element(num,0)}|#{display_element(num,1)}|#{display_element(num,2)}\n"
  end
end
