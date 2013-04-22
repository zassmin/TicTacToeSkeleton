class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

  # create is saving a new game

  # show will show the new game board

  # destroy

end
