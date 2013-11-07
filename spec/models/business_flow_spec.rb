
# Model copied from technical specifications
# Name			Description			Type	Size	Mandatory	Domain		Default		
# PLAYGROUND_ID		Playground ownership		integer		Y				
# ID			Unique id			integer		Y				
# NAME			Name of the playground		varchar	100	Y				
# DESCRIPTION		Description			text						
# CODE			Organisation codification	char	5					Concatenation of previous level		
# BUSINESS_FLOW_ID	Business flow foreign key	integer		Y				
# HIERARCHY		Hierarchical index		varchar	30	Y		Y		
# PCF_INDEX		PCF Index			varchar	30			Y		
# PCF_REFERENCE		Reference in the PCF		varchar	30			Y		
# OWNER_ID		Owner of the Business Flow	integer		Y		Y		Users list
# STATUS_ID		Status of the Business Flow	integer		Y		Y		Statuses list
# CREATED_AT		Creation date			timestamp						
# UPDATED_AT		Update date			timestamp						
# CREATED_BY		User who created		char	30					
# UPDATED_BY		User who updated		char	30					

require 'spec_helper'

describe "Business Flow model validation: " do

  before do
    @business_flow = BusinessFlow.new(business_area_id: 1, playground_id: 0, name: "TEST BUSINESS FLOW", description: "Example of Business Flow", code: "BF-1", hierarchy: "1-1-0", PCF_index: "1.1.0", PCF_reference: "B-5", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @business_flow }

###B.FLOW2 to test that B. Flow mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:business_area_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###B.FLOW3 to test that mandatory fields are tested for null values
  describe "when business_area_id is not present" do
    before { @business_flow.business_area_id = " " }
    it { should_not be_valid }
  end
  describe "when playground_id is not present" do
    before { @business_flow.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @business_flow.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @business_flow.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @business_flow.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @business_flow.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @business_flow.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @business_flow.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @business_flow.updated_by = " " }
    it { should_not be_valid }
  end

###B.FLOW4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @business_flow.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @business_flow.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @business_flow.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when PCF_index is longer than 30" do
    before { @business_flow.PCF_index = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when PCF_reference is longer than 30" do
    before { @business_flow.PCF_reference = "a" * 31 }
    it { should_not be_valid }
  end

###B.FLOW5 to test that fields are checked for unicity
  describe "when business Flow is duplicated" do
    before do
      @business_flow_duplicate = @business_flow.dup
      @business_flow_duplicate.save!
    end
    it {should_not be_valid}
  end


end
