require 'spec_helper'

describe "Parameters pages: " do

  subject { page }

### PARAM1 to test that Parameters management page has header and title only when signed-in
  describe "when not signed_in " do

    describe "page" do
      before { visit parameters_path }

      it {should have_content('sign in')}
    end
  end

  describe "when signed_in" do
      before { visit signin_path }
      let(:user) { FactoryBot.create(:user) }
      before do
        fill_in "Login",    with: user.login
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

    describe "Page" do
      before { visit parameters_path }

      it { should have_selector('h1', text: 'parameters') }
      it { should have_title('Managing parameters') }
      it { should have_content('New Parameter') }
    end
  end

end
