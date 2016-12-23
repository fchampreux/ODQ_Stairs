# == Schema Information
#
# Table name: landscapes
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  status_id     :integer
#  owner_id      :integer
#  all_records   :integer
#  bad_records   :integer
#  score         :integer
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'spec_helper'

describe "Landscape model validation: " do

  before do
    @landscape = Landscape.new(playground_id: 0, name: "TEST LANDSCAPE", description: "Example of Landscape", code: "LD-1", 
	hierarchy: "1-1-0", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @landscape }

###LANDSCAPE2 to test that Landscape mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###LANDSCAPE3 to test that mandatory fields are tested for null values
  describe "when playground_id is not present" do
    before { @landscape.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @landscape.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @landscape.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @landscape.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @landscape.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @landscape.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @landscape.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @landscape.updated_by = " " }
    it { should_not be_valid }
  end

###LANDSCAPE4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @landscape.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @landscape.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @landscape.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when pcf_index is longer than 30" do
    before { @landscape.pcf_index = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when pcf_reference is longer than 30" do
    before { @landscape.pcf_reference = "a" * 31 }
    it { should_not be_valid }
  end

###LANDSCAPE5 to test that fields are checked for unicity
  describe "when business Area is duplicated" do
    before do
      @landscape_duplicate = @landscape.dup
      @landscape_duplicate.save!
    end
    it {should_not be_valid}
  end


end
