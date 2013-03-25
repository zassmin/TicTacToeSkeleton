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
		@show_board.board.length == 3
	end

	it "should always have the array within the array length of 3" do
		@show_board.board.each { |array| array.length } == 3		
	end 

	describe "player_position" do 
		it "should establish a position on the board, using 'x' or 'o'" do
			@show_board.player_position('x', 0, 1) == @show_board.board[0][2]
		end
	end

end