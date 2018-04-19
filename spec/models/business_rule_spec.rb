# == Schema Information
#
# Table name: business_rules
#
#  id                     :integer          not null, primary key
#  playground_id          :integer          not null
#  business_process_id    :integer          not null
#  business_object_id     :integer
#  code                   :string(60)       not null
#  name                   :string(100)      not null
#  description            :text
#  business_value         :text
#  hierarchy              :string(25)       not null
#  check_description      :text
#  check_script           :text
#  check_language_id      :text             default("0")
#  correction_method      :text
#  correction_script      :text
#  correction_language_id :text             default("0")
#  correction_batch       :string(100)
#  white_list             :text
#  added_value            :integer          default(0)
#  maintenance_cost       :integer          default(0)
#  maintenance_duration   :integer          default(0)
#  rule_type_id           :integer          not null
#  severity_id            :integer          not null
#  complexity_id          :integer          not null
#  status_id              :integer          not null
#  owner_id               :integer          not null
#  all_records            :integer          default(0)
#  bad_records            :integer          default(0)
#  score                  :integer          default(0)
#  created_by             :string(100)      not null
#  updated_by             :string(100)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

require 'rails_helper'

RSpec.describe BusinessRule, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:business_rule)}
#    it { should validate_presence_of(:hierarchy) }
#    it { should validate_uniqueness_of(:hierarchy).case_insensitive }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:playground_id) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_presence_of(:code) }
#    it { should validate_uniqueness_of(:code).scoped_to(:business_process_id) }
    it { should validate_length_of(:code).is_at_most(10)}
#    it { should validate_presence_of(:playground_id) }
#    it { should validate_presence_of(:business_process) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:business_rule)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:business_rule, name: nil)).to_not be_valid
  end
  
  
=begin
###B.PROCESS5 to test that fields are checked for unicity
  describe "when business process is duplicated" do
    before do
      @business_process_duplicate = @business_process.dup
      @business_process_duplicate.save!
    end
    it {should_not be_valid}
  end
=end

end
