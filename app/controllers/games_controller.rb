class GamesController < ApplicationController

	def index
		@games = Game.all
	end

	def new
		@game = Game.new
	end

  #  def update
  #    # insert an O or an X
  #  end
  #
  #  def destroy
  #    # delete game
  # end
end
