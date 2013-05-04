class GamesController < ApplicationController

# start writing tests for these controllers!

	def index
		@games = Game.all
	end
  puts @games.inspect

  #path /new
	def new
		@game = Game.new
    redirect_to show_path, :status => 301
	end
  puts @game.inspect
 
  def show
    if Game.exists?(params[:id])
      @game = Game.find(params[:id])
    end
  end
  
  def create
     @game = Game.create!
  end

  def destroy
  end

  def play
    unless Game.exists?(params[:id])
      render :success => false,
             :id => params[:id],
             :status => 404
    else
      game = Game.find(params[:id])
      success = game.play

      render :success => success,
             :id => game.id,
             :game => game,
             :state => game.status,
             :status => (success ? 200 : 400)
    end
  end
end
