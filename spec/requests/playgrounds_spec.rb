require 'spec_helper'

describe "Playground pages: " do

  subject { page }

### PLAYGROUND1 to test that B. Area Page has header and title only when signed-in
  describe "when not signed_in " do

    describe "page" do
      before { visit playgrounds_path }

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
      before { visit playgrounds_path }

      it { should have_selector('h1', text: 'Playgrounds') }
      it { should have_title('Managing playrounds') }
      it { should have_content('New Playground') }
    end
  end

end
