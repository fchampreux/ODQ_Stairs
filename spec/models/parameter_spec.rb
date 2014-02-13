# == Schema Information
#
# Table name: parameters
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  active_from        :datetime
#  active_to          :datetime
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  parent_list        :string(255)
#  param_value        :string(255)
#  parameters_list_id :integer
#  param_code         :string(255)
#

require 'spec_helper'

describe "Parameter model validation: " do

  before do
    @parameter = Parameter.new(playground_id: 0, is_list: 0, name: "TEST PARAMETER", description: "Example of Parameter", code: "LIST",
	active_from: Time.now-1.days, active_to: Time.now+1.days, created_by: "Fred", updated_by: "Fred", parent_list: "Lists of parameters")
  end

  subject { @parameter }

###PARAM2 to test that B. Area mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:created_by) }
    it { should respond_to(:updated_by) }
    it { should respond_to(:active_from) }
    it { should respond_to(:active_to) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }

    it {should be_valid}

  end

###PARAM3 to test that mandatory fields are tested for null values
  describe "when playground_id is not present" do
    before { @parameter.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @parameter.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @parameter.code = " " }
    it { should_not be_valid }
  end
  describe "when active start date is not present" do
    before { @parameter.active_from = " " }
    it { should_not be_valid }
  end
  describe "when active end date is not present" do
    before { @parameter.active_to = " "}
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @parameter.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @parameter.updated_by = " " }
    it { should_not be_valid }
  end

###PARAM4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @parameter.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 100" do
    before { @parameter.code = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when description is longer than 1000" do
    before { @parameter.description = "a" * 1001 }
    it { should_not be_valid }
  end

###PARAM5 to test that fields are checked for unicity
  describe "when parameter is duplicated" do
    before do
      @parameter_duplicate = @parameter.dup
      @parameter_duplicate.save!
    end
    it {should_not be_valid}
  end


end
