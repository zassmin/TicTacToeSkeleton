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
  end

  it "should have the correct link on the layout" do
    visit root_path

    click_link 'Start Game!'
    click_link 'Start Game'
    page.should have_selector 'title', text: full_title('Play Game')
  end

  describe "Show page" do
    before { visit new_path }

    let(:heading)    { 'Play Game' }
    let(:page_title) { 'Play Game' }

    it_should_behave_like "all games pages"
  end

  it "should have the correct link on the layout" do
    visit new_path

    click_link 'Start Game'
    page.should have_selector 'title', text: full_title('Play Game')
    click_link ''
    page.should have_content ''
  end
end