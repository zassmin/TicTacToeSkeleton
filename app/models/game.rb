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

  def check_rows_for_winner
    board.each do |a|
      if a[0]
        return a[0] == a[1] && a[0] == a[2]
      end
    end
    return false
  end

  def check_columns_for_winner
    (0..2).each do |e|
      if board[0][e]
        return board[0][e] == board[1][e] && board[0][e] == board[2][e]
      end
    end
    false
  end

  def check_slants_for_winner
    if board[1][1]
      if board[0][0] == board[1][1] && board[0][0] == board[2][2]
        true
      elsif board[0][2] == board[1][1] && board[0][2] == board[2][0]
        true
      end
    else
      false
    end
  end

  def winner?
    if check_rows_for_winner
      true
    elsif check_columns_for_winner
      true
    elsif check_slants_for_winner
      true
    else
      false
    end
  end
  # TODO
  # Only create default values for the board in the db OR initialize it in the model, not both!
  # Play method
  # current_player (maybe - is it necessary?)
end

# board = Game.new
# board.update_board('x', 0, 1)
# board.update_board('o', 0, 2)
# puts board.display_board
