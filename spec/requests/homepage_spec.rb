require 'spec_helper'

describe "Home page" do

  subject { page }

###1
  describe "title" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Welcome') }
    it { should have_selector('title', text: 'Home') }

  end
end
