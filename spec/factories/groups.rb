# == Schema Information
#
# Table name: groups
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :string
#  role            :string
#  territory_id    :integer
#  organisation_id :integer
#  created_by      :string
#  updated_by      :string
#  active_from     :date
#  active_to       :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  code            :string(10)
#

FactoryGirl.define do
  factory :group do
    name "MyString"
     "MyString"
    description "MyString"
     "MyString"
    role "MyString"
     "MyString"
    territory_id "MyString"
     1
    organisation_id "MyString"
     1
    created_by "MyString"
     "MyString"
    updated_by "MyString"
     "MyString"
    active_from "MyString"
     "2017-06-01"
    active_to "MyString"
     "2017-06-01"
  end
end
