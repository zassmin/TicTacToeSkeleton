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
  # @return ArgumentError
  # 
  # use helpers/games_helper to see board in the terminal
  def update_board(player, row, column)
    board[row][column] = player
    
  end

  # Returns the current_player
  # @return [String] 'x' or 'o'
  def current_player
    # TODO
  end

  # Checks for previous_player by comparing current_player
  def previous_player
    # TODO
  end

  # Plays the game
  # 
  # @returns winner
  # updates the board
  def play(row, column)
    # TODO
  end

  # Checks if there is a winner.
  # @return [Boolean] returns true if there is a winner, false otherwise
  # Calls on private methods below
  def winner?
    # TODO
  end


  # The below methods can only be accessed by methods in this class
  private

  # Establishes winner in row
  def check_rows_for_winner
    # TODO
  end

  # Establishes winner in columns
  def check_columns_for_winner
    # TODO
  end

  # Establishes winner diagonally
  def check_diagonals_for_winner
    # TODO
  end

end
