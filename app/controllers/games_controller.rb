class GamesController < ApplicationController

# start writing tests for these controllers!

	def index
		@games = Game.all
    puts @games.inspect
	end

  # NOTE create method is the same refactor after deciding which to use
  #path /new
	def new
		@game = Game.new
    @game.save!
    redirect_to :action => 'show', :id => @game.id
	end

  def show
    @game = Game.find(params[:id])
  end
  

  # submit the partial here
  def update
    @game = Game.find(params[:id])
    @game.play(params[:game][:row].to_i,params[:game][:column].to_i)
    redirect_to :action => 'show', :id => @game.id
  end
end
