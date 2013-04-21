require 'spec_helper'

describe GamesHelper do
  before do
    @test_game = Game.new
  end

  describe "display_element" do
    it "should display @board element" do
      @test_game.update_board('x', 0, 1)

      @test_game.display_element(0,1).should == 'x'
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