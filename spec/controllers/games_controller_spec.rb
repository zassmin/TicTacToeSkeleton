# GamesController_controller_spec

require 'spec_helper'

describe GamesController do
	describe "GET games#index" do
		before(:each) do 
			get :index
		end

		it "should set the @games instance variable to a set of all Games" do
        	assigns[:games].should_not be_nil
        	assigns[:games].all? {|game| game.kind_of?(Game)}.should be_true
    	end
    end

    describe "GET games#new" do
    	before(:each) do
      		get :new
    	end

    	it "should set the @game variable to a new game" do
      		assigns[:game].try(:kind_of?, Game).should be_true
    	end
	end
end
