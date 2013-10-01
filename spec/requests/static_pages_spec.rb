require 'spec_helper'

describe "Static pages : " do

  subject { page }

###1
  describe "Home" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Welcome') }
    it { should have_title('Home') }

  end

  describe "About" do
    before { visit '/about' }

    it { should have_selector('h1',    text: 'What is') }
    it { should have_title('About') }

  end

  describe "Help" do
    before { visit '/help'}

    it { should have_selector('h1',    text: 'Help') }
    it { should have_title('Help') }

  end

  describe "Contact" do
    before { visit '/contact' }

    it { should have_selector('h1',    text: 'Contact') }
    it { should have_title('Contact') }

  end
end
