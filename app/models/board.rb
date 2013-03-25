# board.rb

class Board
	attr_accessor :board

	def initialize 
		@board = [[nil, nil, nil], 
				  [nil, nil, nil], 
				  [nil, nil, nil]]
	end
	# assigning nil gives it the nilclass, so << doesn't work on the array
	# TODO: change the array values... 

	def player_position(position, first_element, second_element)
		@board[first_element][second_element] = position
	end

end
