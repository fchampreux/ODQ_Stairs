# == Schema Information
#
# Table name: groups
#
#  id              :integer          not null, primary key
#  membership_id   :integer          not null
#  code            :string(60)       not null
#  name            :string(100)      not null
#  description     :string
#  territory_id    :integer          not null
#  organisation_id :integer          not null
#  role_id         :integer          not null
#  owner_id        :integer          not null
#  created_by      :string(100)      not null
#  updated_by      :string(100)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

FactoryBot.define do
  factory :group do
    name            "MyString"
    description     "MyString"
    role            "MyString"
    territory_id    1
    organisation_id 1
    created_by      "Fred"
    updated_by      "Fred"
    active_from     "2017-06-01"
    active_to       "2022-06-01"
  end
end
