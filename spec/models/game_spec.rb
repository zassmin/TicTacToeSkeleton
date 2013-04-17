require 'spec_helper'
require 'game'

describe Game do 
	before do
		@test_game = Game.new
	end

	describe "board" do
		it "should be initialized with nil values inside of the array, [[]]" do
			@test_game.board.should == [[nil, nil, nil], 
									    [nil, nil, nil], 
									    [nil, nil, nil]] 
		end

		it "should always have a length of 3" do 
			@test_game.board.length.should == 3
		end

		it "should always have the array within the array length of 3" do
			@test_game.board.each { |array| array.length.should == 3 } 		
		end 
	end

	describe "update_board" do 
		it "should establish a position on the board, using 'x' or 'o'" do
			to_test = @test_game.update_board('x', 0, 1)
			to_test.should == @test_game.board[0][1]
		end

    it "should not allow an 'x' or 'o' to be inserted into an already full spot" do
      @test_game.update_board('x', 0, 0)
      to_test = @test_game.update_board('x', 0, 0)
      to_test.should == GameError
    end
	end

	describe "display_element" do
		it "should display @board element" do
			mock_player = @test_game.update_board('x', 0, 1)

			to_test = @test_game.display_element(0,1)
			to_test.should == mock_player
		end

		it "should display a space if the element is nil" do
			@test_game.display_element(0,0).should == ' '
		end

		it "should display an 'x' or an 'o' if the element is not a space" do
		  @test_game.update_board('x', 0, 1)
		  @test_game.display_element(0,1).should == 'x'
		end
	end

	describe "display_line" do 
		it "should display player marks or a space (if nil) in the designated row" do 
			@test_game.update_board('x', 0, 2)

			to_test = @test_game.display_line(0)
			to_test.should == " | |x\n"
		end
	end

  	describe "display_board" do 
	 	it "should display board" do 
	 		@test_game.display_board.should == " | | \n" + 
	 										   "- - -\n" +
	 										   " | | \n" +
      										   "- - -\n" +
	 										   " | | \n"
	 	end

    	it "should display player marks on the board" do
    		@test_game.update_board('x', 0, 0)
    		@test_game.update_board('o', 1, 1)
    		@test_game.update_board('x', 2, 2)

    		@test_game.display_board.should == "x| | \n" + 
	 										   "- - -\n" +
	 									   	   " |o| \n" +
      										   "- - -\n" +
	 										   " | |x\n"
		end
	end
end
