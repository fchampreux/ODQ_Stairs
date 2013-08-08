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
		email: "user@example.com", active_from: "2013-01-01", active_to: "2113-01-01", is_admin: 1.zero?)
  end

  subject { @user }

  describe "availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:default_playground_id) }
    it { should respond_to(:active_from) }
    it { should respond_to(:active_to) }
    it { should respond_to(:last_name) }
    it { should respond_to(:login) }
    it { should respond_to(:email) }
    it { should respond_to(:is_admin) }

    it { should be_valid}
  end

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



end

