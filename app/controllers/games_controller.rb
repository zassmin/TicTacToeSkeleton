class GamesController < ApplicationController

# start writing tests for these controllers!

	def index
		@games = Game.all
    puts @games.inspect
	end

  # we want this method to redirect to show!
	def new
		@game = Game.new
    @game.save!
    redirect_to :action => 'show', :id => @game.id
	end

  def show
    @game = Game.find(params[:id])
  end
  

  # submit to the partial _board_form
  # Play game using @params
  # Flash winner
  def update
    @game = Game.find(params[:id])
    @game.play(params[:game][:row].to_i,params[:game][:column].to_i)
    redirect_to :action => 'show', :id => @game.id
    if @game.winner?
      flash[:success] = "Player #{@game.previous_player} is the winner!"
    end
  end
end
