class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

  def create 
    #is saving a new game
  end
  
  # show will show the new game board

  # destroy

end
