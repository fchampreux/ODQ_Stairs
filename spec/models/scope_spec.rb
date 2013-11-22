# == Schema Information
#
# Table name: scopes
#
#  id                      :integer          not null, primary key
#  playground_id           :integer
#  landscape_id            :integer
#  code                    :string(255)
#  name                    :string(255)
#  description             :text
#  SQL_query               :text
#  load_interface          :string(255)
#  organisation_level      :integer
#  territory_level         :integer
#  business_object_id      :integer
#  business_process_id     :integer
#  impacted_business_rules :text
#  hierarchy               :string(255)
#  created_by              :string(255)
#  updated_by              :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  status_id               :integer
#  owner_id                :integer
#


require 'spec_helper'

describe "Scope model validation: " do

  before do
    @scope = Scope.new(playground_id: 0, name: "TEST SCOPE", description: "Example of Scope", code: "SC-1", 
	hierarchy: "1-1-0", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @scope }

###SCOPE2 to test that Scope mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###SCOPE3 to test that mandatory fields are tested for null values
  describe "when playground_id is not present" do
    before { @scope.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @scope.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @scope.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @scope.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @scope.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @scope.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @scope.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @scope.updated_by = " " }
    it { should_not be_valid }
  end

###B.AREA4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @scope.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @scope.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @scope.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end

###SCOPE5 to test that fields are checked for unicity
  describe "when Scope is duplicated" do
    before do
      @scope_duplicate = @scope.dup
      @scope_duplicate.save!
    end
    it {should_not be_valid}
  end


end
