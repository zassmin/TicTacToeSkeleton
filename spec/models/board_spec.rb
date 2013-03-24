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
end
