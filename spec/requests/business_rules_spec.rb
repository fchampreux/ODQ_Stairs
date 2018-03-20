require 'spec_helper'

describe "Business Rules pages: " do

  subject { page }

### B.RULE1 to test that B. Rule Page has header and title only when signed-in
  describe "when not signed_in " do

    describe "page" do
      before { visit business_rules_path }

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
      before { visit business_rules_path }

      it { should have_selector('h1', text: 'Business rules') }
      it { should have_title('Managing business rules') }
      it { should_not have_content('New Business rule') }
    end
  end

end
