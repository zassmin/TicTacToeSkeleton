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
          @game_id = Game.create(:id)
          get :show, :id => @game_id
        end

        it 'should set the @game instance variable' do
          assigns[:game].try(:kind_of?, Game).should be_true
          assigns[:game].should == Game.find(@game_id)
        end
      end

      describe 'with invalid params' do
        before(:each) do
          Game.create!
          invalid_id = (Game.last.id + 1)
          get :show, :id => invalid_id
        end
      end
    end
end
