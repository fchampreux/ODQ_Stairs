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


#FactoryBot.factories.clear
FactoryBot.define do
  factory :business_rule do
    business_process_id  -1
    business_object_id   -1
    playground_id       1000000
    name                "Test Business Rule"
    code                "TEST_BP"
    description         "This is a test Business rule used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
#    session_id          "TestRun-01"
    owner_id            1
    status_id           0
    end

end
