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

	def update_board(player, row, column)
    if board[row][column]
      raise ArgumentError, "This spot is not empty."
    else
		  board[row][column] = player
      self.save
    end
	end

  def current_player(turn)
    if turn.even?
      'x'
    else
      'o'
    end
  end

  def play
    # will call on update board
    # will call on current player

    (0..8).each do |num|
      update_board(current_player(num), board[row], board[row][column])
      # how does it know to I 
    end

  end

  # This might not actually be necessary. In the views, we can draw a permanent grid
  # and insert the value of each cell into it. 
  # Would be helpful to have so people can play before they get to the views
  # ...might have this under a helper module
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
  # Only create default values for the board in the db OR initialize it in the model, not both!
  # Play method
  # winner?
  # current_player (maybe - is it necessary?)
end