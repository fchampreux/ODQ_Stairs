# == Schema Information
#
# Table name: playgrounds
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)
#  description :text
#  hierarchy   :string(255)
#  status_id   :integer
#  owner_id    :integer
#  all_records :integer
#  bad_records :integer
#  score       :integer
#  created_by  :string(255)
#  updated_by  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe "Playground model validation: " do

  before do
    @playground = Playground.new(name: "TEST PLAYGROUND", description: "Example of Playground", code: "PG-1", 
	hierarchy: "1-1-0", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @playground }

###PLAYGROUND2 to test that Playground mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###PLAYGROUND3 to test that mandatory fields are tested for null values
  describe "when playground_id is not present" do
    before { @playground.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @playground.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @playground.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @playground.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @playground.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @playground.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @playground.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @playground.updated_by = " " }
    it { should_not be_valid }
  end

###PLAYGROUND4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @playground.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @playground.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @playground.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when pcf_index is longer than 30" do
    before { @playground.pcf_index = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when pcf_reference is longer than 30" do
    before { @playground.pcf_reference = "a" * 31 }
    it { should_not be_valid }
  end

###PLAYGROUND5 to test that fields are checked for unicity
  describe "when business Area is duplicated" do
    before do
      @playground_duplicate = @playground.dup
      @playground_duplicate.save!
    end
    it {should_not be_valid}
  end


end
