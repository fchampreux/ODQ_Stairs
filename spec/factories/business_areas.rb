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
#  pcf_index     :string(255)
#  pcf_reference :string(255)
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



#FactoryBot.factories.clear
FactoryBot.define do
  factory :business_area do
    id                  0
    playground_id       1000000
    name                "Test Business Area"
    code                "TEST_BA"
    description         "This is a test Business Area used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
#    session_id          "TestRun-01"
    owner_id            1
    status_id           0
    end
end
