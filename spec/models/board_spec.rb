require 'spec_helper'
require 'board.rb'

describe Board do 
	before do
		@show_board = Board.new
	end

	it "should be initialized with nil values inside of the array, [[]]" do
		@show_board.board.should == [[nil, nil, nil], 
									 [nil, nil, nil], 
									 [nil, nil, nil]] 
	end

	it "should always have a length of 3" do 
		@show_board.board.length.should == 3
	end

	it "should always have the array within the array length of 3" do
		@show_board.board.each { |array| array.length.should == 3 } 		
	end 

	describe "assign_player_position" do 
		it "should establish a position on the board, using 'x' or 'o'" do
			to_test = @show_board.assign_player_position('x', 0, 1)
			to_test.should == @show_board.board[0][1]
		end
	end

	describe "display_element" do
		it "should display @board element" do
			mock_player = @show_board.assign_player_position('x', 0, 1)

			to_test = @show_board.display_element(0,1)
			to_test.should == mock_player
		end

		it "should display a space if the element is nil" do
			@show_board.display_element(0,0).should == ' '
		end

		it "should display an 'x' or an 'o' if the element is not a space" do
		  @show_board.assign_player_position('x', 0, 1)
		  @show_board.display_element(0,1).should == 'x'
		end
	end

  describe "display_board" do 
	 	it "should display board" do 
	 		to_test = @show_board.display_board.should == " | | \n" + 
	 													  "- - -\n" +
	 													  " | | \n" +
      													  "- - -\n" +
	 													  " | | \n"
	 	end
	end

end
