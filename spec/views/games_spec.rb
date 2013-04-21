require 'spec helper'

describe "Games" do
  
  subject { page }

  shared_examples_for "games" do
    it { should have_selector('h1', text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end
end