require 'spec_helper'

describe "Games" do
  
  subject { page }

  shared_examples_for "all games pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Index page" do
    before { visit root_path }

    let(:heading)    { 'TicTacToe' }
    let(:page_title) { '' }

    it_should_behave_like "all games pages"

    it "should have a link to the game" do
      visit root_path

      click_link 'Start Game!'
      page.should have_selector 'title', text: full_title('Play Game')
    end
  end


  describe "Show page" do
    before { visit new_path }

    let(:heading)    { 'Play Game' }
    let(:page_title) { 'Play Game' }

    it_should_behave_like "all games pages"

    it "should show the updated board when a square is clicked" do
      # TODO This button with likely eventually have a different name
      click_button '0, 0'

      page.should have_selector 'td', text: 'x'
    end
  end

  it "should have the correct link on the layout" do
    # Visiting root, not new, because new redirects to the show page which is the page where a game is played
    # which would mean that this test automatically passes, even if the link doesn't work
    visit root_path

    click_link 'Start Game'
    page.should have_selector 'title', text: full_title('Play Game')
  end
end
