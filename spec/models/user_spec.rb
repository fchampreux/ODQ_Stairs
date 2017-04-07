# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  playground_id          :integer
#  default_playground_id  :integer
#  current_playground_id  :integer
#  current_landscape_id   :integer
#  directory_id           :string(255)
#  login                  :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  name                   :string(255)
#  language               :string
#  description            :text
#  active_from            :datetime
#  active_to              :datetime
#  is_admin               :boolean
#  password_digest        :string(255)
#  remember_token         :string(255)
#  created_by             :string(255)
#  updated_by             :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#

# Model copied from technical specifications
# Name			Description				Type		Size	Mandatory	Domain
# PLAYGROUND_ID		Playground ownership			integer			Y	
# DEFAULT_PLAYGROUND_ID	Default Playground 			integer			Y	
# CURRENT_PLAYGROUND_ID	Last Playground used			integer			
# CURRENT_LANDSCAPE_ID	Last Landscape used			integer			
# DIRECTORY_ID		Foreign identification system id	string		30		
# ID			Unique id				integer			Y	
# FIRST_NAME		First name of user			string		100		
# LAST_NAME		Last name of user			string		100	Y	
# DESCRIPTION		Description				text			
# EMAIL			User eMail				string		100	Y	
# LOGIN			User login				string		30	Y	
# ACTIVE_FROM		Activity window start date		date/time		Y	
# ACTIVE_TO		Activity window end date		date/time		Y	
# IS_ADMIN		Admin flag				boolean			Y		0, 1
# PASSWORD_DIGEST	Password hash				string		100		
# REMEMBER_TOKEN	Cookie					string		100		
# CREATED_AT		Creation date				timestamp			
# UPDATED_AT		Update date				timestamp			
# CREATED_BY		User who created			string		30		
# UPDATED_BY		User who updated			string		30		


require 'spec_helper'

describe "User model validation:" do

  before do
    @user = User.new(playground_id: 0, default_playground_id: 0, last_name: "Example User", login: "EX_USR", 
		email: "user@example.com", active_from: "2013-01-01", active_to: "2113-01-01", is_admin: 1.zero?,
                     password: "dummy_one", password_confirmation: "dummy_one")
  end

  subject { @user }

###USER1 to test that mandatory fields are present in the model
  describe "availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:default_playground_id) }
    it { should respond_to(:active_from) }
    it { should respond_to(:active_to) }
    it { should respond_to(:last_name) }
    it { should respond_to(:login) }
    it { should respond_to(:email) }
    it { should respond_to(:is_admin) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) }

    it { should be_valid}
  end

###USER2 to test that mandatory fields are tested for null values
  describe "when playground_id is not present" do
    before { @user.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when default_playground_id is not present" do
    before { @user.default_playground_id = " " }
    it { should_not be_valid }
  end
  describe "when active_from is not present" do
    before { @user.active_from = " " }
    it { should_not be_valid }
  end
  describe "when active_to is not present" do
    before { @user.active_to = " " }
    it { should_not be_valid }
  end
  describe "when last_name is not present" do
    before { @user.last_name = " " }
    it { should_not be_valid }
  end
  describe "when login is not present" do
    before { @user.login = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

###USER3 to test that length of fields is controlled
  describe "when directory_id length is more than 100" do
    before { @user.directory_id = ("a" * 101) }
    it { should_not be_valid }
  end
  describe "when first_name length is more than 100" do
    before { @user.first_name = ("a" * 101) }
    it { should_not be_valid }
  end
  describe "when last_name length is more than 100" do
    before { @user.last_name = ("a" * 101) }
    it { should_not be_valid }
  end
  describe "when email length is more than 100" do
    before { @user.email = ("a" * 101) }
    it { should_not be_valid }
  end
  describe "when login length is more than 30" do
    before { @user.login = ("a" * 31) }
    it { should_not be_valid }
  end
  describe "when password_digest length is more than 100" do
    before { @user.password_digest = ("a" * 101) }
    it { should_not be_valid }
  end
  describe "when remember_token length is more than 100" do
    before { @user.remember_token = ("a" * 101) }
    it { should_not be_valid }
  end
  describe "when created_by length is more than 30" do
    before { @user.created_by = ("a" * 31) }
    it { should_not be_valid }
  end
  describe "when updated_by length is more than 30" do
    before { @user.updated_by = ("a" * 31) }
    it { should_not be_valid }
  end

###USER4 to test that email field content is correctly formated 
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end

###USER5 to test that email and login have unique values
  describe "when email address or login are already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

###USER6 to test that password is correctly managed
  describe "when password is not present" do
    before do
      @user = User.new(playground_id: 0, default_playground_id: 0, last_name: "Other User", login: "OTHER_USR", 
		email: "other@example.com", active_from: "2013-01-01", active_to: "2113-01-01", is_admin: 1.zero?,
                     password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before do 
      @user.password = "good_one"
      @user.password_confirmation = "mismatch" 
    end
    it { should_not be_valid }
  end

  describe "return value of authenticate method" do
    before do
      @user.password = @user.password_confirmation = "good_one"
      @user.save! 
    end
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end

###USER7 to test that the remember token is initialised

  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end

