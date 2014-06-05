# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  code               :string(255)
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  db_technology      :string(255)
#  db_connection      :string(255)
#  db_owner_schema    :string(255)
#  structure_name     :string(255)
#  key_columns        :text
#  published_columns  :text
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_area_id   :integer
#  all_records        :integer
#  bad_records        :integer
#

					

require 'spec_helper'

describe "Business Object model validation: " do

  before do
    @business_object = BusinessObject.new(business_process_id: 1, playground_id: 0, name: "TEST BUSINESS OBJECT", description: "Example of Business Object", code: "BO-1", hierarchy: "1-1-0", PCF_index: "1.1.0", PCF_reference: "O-5", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @business_object }

###B.OBJECT2 to test that B. object mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:business_process_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###B.OBJECT3 to test that mandatory fields are tested for null values
  describe "when business_process_id is not present" do
    before { @business_object.business_process_id = " " }
    it { should_not be_valid }
  end
  describe "when playground_id is not present" do
    before { @business_object.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @business_object.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @business_object.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @business_object.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @business_object.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @business_object.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @business_object.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @business_object.updated_by = " " }
    it { should_not be_valid }
  end

###B.OBJECT4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @business_object.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @business_object.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @business_object.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when PCF_index is longer than 30" do
    before { @business_object.PCF_index = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when PCF_reference is longer than 30" do
    before { @business_object.PCF_reference = "a" * 31 }
    it { should_not be_valid }
  end

###B.OBJECT5 to test that fields are checked for unicity
  describe "when business object is duplicated" do
    before do
      @business_object_duplicate = @business_object.dup
      @business_object_duplicate.save!
    end
    it {should_not be_valid}
  end


end
