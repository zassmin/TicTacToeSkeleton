class Game < ActiveRecord::Base
  # Saves the board in the database as an object, 
  # and allows you to retrieve as the same object
  serialize :board
  
  include GamesHelper
  include ActiveModel::Validations

  # This line tells Rails which attributes of the model are accessible, i.e., 
  # which attributes can be modified automatically by outside users 
  # (such as users submitting requests with web browsers).
  attr_accessible :board

  validates :board, :presence => true

  # Initializes the object with a board, made up of a two dimensional array of
  # nils. Eg
  #   board = [ [nil, nil, nil],
  #             [nil, nil, nil],
  #             [nil, nil, nil]  ]
  #
  # This is called when you use `Game.new` or `Game.create!`.
  # NOTE ActiveRecord::Base does not have a #create method.
  def initialize
    super
    self.board = Array.new(3).map{[nil, nil, nil]} 
  end

  # Updates the board based on player, row, and column
  #
  # @param player [String] either 'x' or 'o'
  # @param row [Integer] 0-2
  # @param column [Integer] 0-2
  # @return [Boolean] Save successful?
  # 
  # use helpers/games_helper to see board in the terminal
  def update_board(player, row, column)
    unless player.in? %w(o x)
      raise ArgumentError, "Player must be either 'x' or 'o'."
    end

    unless row.in?(0..2) && column.in?(0..2)
      raise ArgumentError, "Row and Column must be within range. (0-2)"
    end

    if board[row][column]
      raise ArgumentError, "This spot is full."
    else
      board[row][column] = player
      self.save!
    end
  end

  # Returns the current_player
  # @return [String] 'x' or 'o'
  def current_player
    turn_num = self.board.flatten.compact.count
    if turn_num.even?
      'x'
    else
      'o'
    end
  end

  # checks for previous_player by comparing current_player
  def previous_player
    current_player == 'x' ? 'o' : 'x'
  end

  # Plays the game
  # calls on update_board and winner?
  def play(row, column)
    # TODO We need to call this method AFTER each move, not before
    # 
    if winner?
      "Player #{previous_player} is the winner!"
    else
      update_board(current_player, row, column)
    end
  end

  # Checks if there is a winner.
  # TODO / NOTE: I would prefer to see this method return the winner, or nil
  # @return [Boolean] returns true if there is a winner, false otherwise
  def winner?
    if check_rows_for_winner
      true
    elsif check_columns_for_winner
      true
    elsif check_diagonals_for_winner
      true
    else
      false
    end
  end


  # The below methods can only be accessed by methods in this class
  private

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

  def check_diagonals_for_winner
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

end
