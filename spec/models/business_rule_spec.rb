# == Schema Information
#
# Table name: business_rules
#
#  id                   :integer          not null, primary key
#  playground_id        :integer
#  business_process_id  :integer
#  business_object_id   :integer
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
#  rule_type_id         :integer
#  severity_id          :integer
#  complexity_id        :integer
#  all_records          :integer
#  bad_records          :integer
#  score                :integer
#  created_by           :string(255)
#  updated_by           :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

require 'rails_helper'

RSpec.describe BusinessRule, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:business_rule)}
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:business_object_id) }
    it { should respond_to(:business_process_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }


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
