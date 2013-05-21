# GamesController_controller_spec

require 'spec_helper'

describe GamesController do
	describe "games#index" do
		before(:each) do 
			get :index
		end

		it "should set the @games instance variable to a set of all Games" do
    	assigns[:games].should_not be_nil
    	assigns[:games].all? {|game| game.kind_of?(Game)}.should be_true
   	end
  end

  describe "games#new" do
  	before(:each) do
   		get :new
   	end

   	it "should set the @game variable to a new game" do
   		assigns[:game].try(:kind_of?, Game).should be_true
   	end
	end

  describe "games#show" do
    describe 'with valid params' do
      before(:each) do
        # @game_id = Game.create(:id)
        g = Game.new
        g.save

        @game_id = g.id
        get :show, :id => @game_id
      end

      it 'should set the @game instance variable' do
        assigns[:game].try(:kind_of?, Game).should be_true
        assigns[:game].should == Game.find(@game_id)
      end
    end

    describe 'with invalid params' do
      before(:each) do
        invalid_id = (Game.last.id + 1)
        get :show, :id => invalid_id
      end

      # it "should not create a game"
    end
  end

  describe "games#update" do
    before(:each) do
      @game = Game.new
      @game.save!
    end

    # it "should enter a value into the board" do
    #   # TODO How do we test this?  We need a mock or something.
    #   @game.update
    #   @game.board.should == [['x', nil, nil],[nil, nil, nil],[nil, nil, nil]]
    # end
  end
end
