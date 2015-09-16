# == Schema Information
#
# Table name: business_processes
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  business_flow_id :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  hierarchy        :string(255)
#  pcf_index        :string(255)
#  pcf_reference    :string(255)
#  status_id        :integer
#  owner_id         :integer
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  all_records      :integer
#  bad_records      :integer
#  score            :integer
#  odq_unique_id    :integer
#  odq_object_id    :integer
#


# Model copied from technical specifications
# Name			Description			Type	Size	Mandatory	Domain		Default		
# PLAYGROUND_ID		Playground ownership		integer		Y				
# ID			Unique id			integer		Y				
# NAME			Name of the playground		varchar	100	Y				
# DESCRIPTION		Description			text						
# CODE			Organisation codification	char	5					Concatenation of previous level		
# BUSINESS_FLOW_ID	Business process foreign key	integer		Y				
# HIERARCHY		Hierarchical index		varchar	30	Y		Y		
# pcf_INDEX		PCF Index			varchar	30			Y		
# pcf_REFERENCE		Reference in the PCF		varchar	30			Y		
# OWNER_ID		Owner of the Business process	integer		Y		Y		Users list
# STATUS_ID		Status of the Business process	integer		Y		Y		Statuses list
# CREATED_AT		Creation date			timestamp						
# UPDATED_AT		Update date			timestamp						
# CREATED_BY		User who created		char	30					
# UPDATED_BY		User who updated		char	30					

require 'spec_helper'

describe "Business Process model validation: " do

  before do
    @business_process = BusinessProcess.new(business_flow_id: 1, playground_id: 0, name: "TEST BUSINESS PROCESS", description: "Example of Business Process", code: "BP-1", hierarchy: "1-1-0", pcf_index: "1.1.0", pcf_reference: "B-5", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @business_process }

###B.PROCESS2 to test that B. Process mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:business_flow_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###B.PROCESS3 to test that mandatory fields are tested for null values
  describe "when business_flow_id is not present" do
    before { @business_process.business_flow_id = " " }
    it { should_not be_valid }
  end
  describe "when playground_id is not present" do
    before { @business_process.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @business_process.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @business_process.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @business_process.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @business_process.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @business_process.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @business_process.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @business_process.updated_by = " " }
    it { should_not be_valid }
  end

###B.PROCESS4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @business_process.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @business_process.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @business_process.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when pcf_index is longer than 30" do
    before { @business_process.pcf_index = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when pcf_reference is longer than 30" do
    before { @business_process.pcf_reference = "a" * 31 }
    it { should_not be_valid }
  end

###B.PROCESS5 to test that fields are checked for unicity
  describe "when business process is duplicated" do
    before do
      @business_process_duplicate = @business_process.dup
      @business_process_duplicate.save!
    end
    it {should_not be_valid}
  end


end
