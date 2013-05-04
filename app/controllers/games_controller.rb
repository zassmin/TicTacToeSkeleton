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
  
  # def create
	# 	@game = Game.new
  #   @game.save!
  #   redirect_to show_path, :id => @game.id
  # end

  # def update(row, column)
  #   @game.play(row, column)
  # end

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
