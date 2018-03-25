# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  title              :string(100)      not null
#  description        :text
#  severity_id        :integer          not null
#  status_id          :integer          not null
#  scope_id           :integer          not null
#  business_object_id :integer          not null
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer          not null
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
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
