require 'spec_helper'

describe "Games" do
  
  subject { page }

  shared_examples_for "all games pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  # doesn't like visit - it's a capybara thing
  describe "Index page" do
    before { visit root_path }

    let(:heading)    { 'TicTacToe' }
    let(:page_title) { '' }

    it_should_behave_like "all games pages"
  end

  describe "New page" do
    before { visit new_path }

    let(:heading)    { 'Play Game' }
    let(:page_title) { '' }

    it_should_behave_like "all games pages"
  end
end