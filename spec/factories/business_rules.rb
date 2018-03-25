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

#FactoryBot.factories.clear
FactoryBot.define do
  factory :business_rule do
    business_process_id  0
    business_object_id   0
    playground_id        0
    name                "Test Business Rule"
    code                "TEST_BP"
    description         "This is a test Business rule used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
    rule_type_id        0
    severity_id         0
    complexity_id       0
    status_id           0
    owner_id            1
    end

end
