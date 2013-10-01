require 'spec_helper'

describe "Authentication : " do

  subject { page }

###2
  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
    it { should have_title('Sign in') }
  end

###3
    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_selector('h2', text: 'sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }

###4
    describe "after visiting another page" do
      before { click_link "About" }
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
