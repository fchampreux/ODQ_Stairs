# == Schema Information
#
# Table name: business_areas
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  PCF_index     :string(255)
#  PCF_reference :string(255)
#  status_id     :integer
#  owner_id      :integer
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  all_records   :integer
#  bad_records   :integer
#


# Model copied from technical specifications
# Name		Description			Type	Size	Mandatory	Unique 	Accessible	Validation		Domain
# PLAYGROUND_ID	Playground ownership		integer			Y				Playground exists		
# ID		Unique id			integer			Y	Y				
# NAME		Name of the Business Area	varchar	100		Y	Y	Y			
# DESCRIPTION	Description			text						
# CODE		Organisation's codification	varchar	30		Y		Y			
# HIERARCHY	Hierarchical index		varchar	30		Y	Y	Y			
# PCF_INDEX	PCF Index			varchar	30			Y			
# PCF_REFERENCE	Reference in the PCF		varchar	30			Y			
# OWNER_ID	Owner of the Business Area	integer			Y		Y		Users list	
# STATUS_ID	Status of the Business Area	integer			Y		Y		Statuses list	
# CREATED_AT	Creation date			timestamp		Y					
# UPDATED_AT	Update date			timestamp		Y					
# CREATED_BY	User who created		char	30		Y					
# UPDATED_BY	User who updated		char	30		Y					

require 'spec_helper'

describe "Business Area model validation: " do

  before do
    @business_area = BusinessArea.new(playground_id: 0, name: "TEST BUSINESS AREA", description: "Example of Business Area", code: "BA-1", 
	hierarchy: "1-1-0", PCF_index: "1.1.0", PCF_reference: "B-5", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @business_area }

###B.AREA2 to test that B. Area mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###B.AREA3 to test that mandatory fields are tested for null values
  describe "when playground_id is not present" do
    before { @business_area.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @business_area.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @business_area.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @business_area.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @business_area.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @business_area.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @business_area.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @business_area.updated_by = " " }
    it { should_not be_valid }
  end

###B.AREA4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @business_area.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @business_area.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @business_area.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when PCF_index is longer than 30" do
    before { @business_area.PCF_index = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when PCF_reference is longer than 30" do
    before { @business_area.PCF_reference = "a" * 31 }
    it { should_not be_valid }
  end

###B.AREA5 to test that fields are checked for unicity
  describe "when business Area is duplicated" do
    before do
      @business_area_duplicate = @business_area.dup
      @business_area_duplicate.save!
    end
    it {should_not be_valid}
  end


end
