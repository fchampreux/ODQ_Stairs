require 'spec_helper'

describe "Authentication" do

  subject { page }

###2
  describe "home page heading" do
    before { visit root_path }

    it { should have_selector('h1',    text: 'Welcome') }
    it { should have_selector('title', text: 'Home') }

###3
    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('h2', text: 'sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

###4
    describe "after visiting another page" do
      before { click_link "Home" }
        it { should_not have_selector('div.alert.alert-error') }
    end
  end

###5
    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Login",    with: user.login.upcase
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end

  end

end
