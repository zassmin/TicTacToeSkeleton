class Game < ActiveRecord::Base
  serialize :board
  # This line tells Rails which attributes of the model are accessible, i.e., 
  # which attributes can be modified automatically by outside users 
  # (such as users submitting requests with web browsers).
	attr_accessible :board, :current_player, :status, :player_o, :player_x, 

	def initialize 
    super
		self.board = Array.new(3).map{[nil, nil, nil]}
	end

	# This could be refactored to use @player_o and @player_x
	def update_board(player, row, column)
    if board[row][column]
      raise ArgumentError, "This spot is not empty."
    else
		  board[row][column] = player
      self.save
    end
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
		element = board[row][column]
		if element
			element
		else
			' '
		end
	end

  def display_line(row)
 		"#{display_element(row,0)}|#{display_element(row,1)}|#{display_element(row,2)}\n"
  end

  # TODO
  # Test changes to board are saved in database in specs
  # Check whether we need to clear the test database in between tests
  # Only create default values for the board in the db OR initialize it in the model, not both!
  # Validate that space in board is empty before allowing anything to be inserted into the board
  # Play method
  # winner?
  # current_player (maybe - is it necessary?)
end

# board = Game.new
# board.update_board('x', 0, 1)
# board.update_board('o', 0, 2)
# puts board.display_board
