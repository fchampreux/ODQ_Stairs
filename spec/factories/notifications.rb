# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  severity_id        :integer
#  status_id          :integer
#  scope_id           :integer
#  business_object_id :integer
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer
#  owner_id           :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  created_at         :datetime
#  updated_at         :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    playground_id 1
    name "MyString"
    description "MyText"
    created_by "MyString"
    updated_by "MyString"
    owner_id 1
    severity_id 1
    scope_id 1
    business_object_id 1
    odq_unique_id 1
    odq_object_id 1
    expected_at "2014-12-07 14:18:10"
    closed_at ""
    responsible_i 1
  end
end
