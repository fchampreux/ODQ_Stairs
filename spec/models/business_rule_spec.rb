# == Schema Information
#
# Table name: business_rules
#
#  id                   :integer          not null, primary key
#  playground_id        :integer
#  code                 :string(255)
#  name                 :string(255)
#  description          :text
#  business_value       :text
#  hierarchy            :string(255)
#  status_id            :integer
#  owner_id             :integer
#  check_description    :text
#  check_script         :text
#  correction_method    :text
#  correction_script    :text
#  correction_batch     :string(255)
#  white_list           :text
#  condition            :text
#  added_value          :integer
#  maintenance_cost     :integer
#  maintenance_duration :integer
#  version              :string(255)
#  approver_id          :integer
#  approved_at          :datetime
#  business_process_id  :integer
#  business_object_id   :integer
#  created_by           :string(255)
#  updated_by           :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  rule_type_id         :integer
#  severity_id          :integer
#  complexity_id        :integer
#  all_records          :integer
#  bad_records          :integer
#  score                :integer
#  odq_unique_id        :integer
#  odq_object_id        :integer
#

					

require 'spec_helper'

describe "Business Rule model validation: " do

  before do
    @business_rule = BusinessRule.new(business_object_id: 1, playground_id: 0, name: "TEST BUSINESS RULE", description: "Example of Business Rule", code: "BR-1", hierarchy: "1-1-0", owner_id: 1, status_id: 1, created_by: "Fred", updated_by: "Fred")
  end

  subject { @business_rule }

###B.RULE2 to test that B. Rule mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:business_object_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }

    it {should be_valid}

  end

###B.RULE3 to test that mandatory fields are tested for null values
  describe "when business_object_id is not present" do
    before { @business_rule.business_object_id = " " }
    it { should_not be_valid }
  end
  describe "when playground_id is not present" do
    before { @business_rule.playground_id = " " }
    it { should_not be_valid }
  end
  describe "when name is not present" do
    before { @business_rule.name = " " }
    it { should_not be_valid }
  end
  describe "when code is not present" do
    before { @business_rule.code = " " }
    it { should_not be_valid }
  end
  describe "when hierarchy is not present" do
    before { @business_rule.hierarchy = " " }
    it { should_not be_valid }
  end
  describe "when owner_id is not present" do
    before { @business_rule.owner_id = " "}
    it { should_not be_valid }
  end
  describe "when status_id is not present" do
    before { @business_rule.status_id = " " }
    it { should_not be_valid }
  end
  describe "when created_by is not present" do
    before { @business_rule.created_by = " " }
    it { should_not be_valid }
  end
  describe "when updated_by is not present" do
    before { @business_rule.updated_by = " " }
    it { should_not be_valid }
  end

###B.RULE4 to test that fields are tested for length
  describe "when name is longer than 100" do
    before { @business_rule.name = "a" * 101 }
    it { should_not be_valid }
  end
  describe "when code is longer than 30" do
    before { @business_rule.code = "a" * 31 }
    it { should_not be_valid }
  end
  describe "when hierarchy is longer than 30" do
    before { @business_rule.hierarchy = "a" * 31 }
    it { should_not be_valid }
  end


###B.RULE5 to test that fields are checked for unicity
  describe "when business rule is duplicated" do
    before do
      @business_rule_duplicate = @business_rule.dup
      @business_rule_duplicate.save!
    end
    it {should_not be_valid}
  end


end
