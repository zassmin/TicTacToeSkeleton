class GamesController < ApplicationController

	def index
		@games = Game.all
	end

  #path /new
	def new
		@game = Game.new
    redirect_to show_path, :status => 301
	end

  # Shows game with given :id
  # @verb MATCH
  # @path /:id
  def show
    if Game.exists?(params[:id])
      @game = Game.find(params[:id])
    else
      render :status => 404
    end
  end
  
  # Creates a game recourse
  #
  # @verb POST
  # @path /games
  # @return :success => true/false
  #         :id      => id of new game
  #         :game    => new game object
  def create
     @game = Game.create!
     render :success => true,
            :id => @game.id,
            :game => @game,
            :status => 201
  end

  def destroy
    if Game.exists?(params[:id]) && Game.destroy(params[:id])
      render :success => true, :status => 200
    else
      render :success => false, :status => 404
    end
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
