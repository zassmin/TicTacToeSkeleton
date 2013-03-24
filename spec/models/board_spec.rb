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

	# rather than nil, i should test empty? or that there is an array! yes!!!
	# check out the data structures from connectfour
	# not quite helpful
	# just do it girl!
	# check that attributes for it exist
	# at which point do I migrate to the database?
	# jsut do this Z!