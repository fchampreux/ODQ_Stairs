# == Schema Information
#
# Table name: organisations
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  code               :string(60)       not null
#  name               :string(100)      not null
#  description        :text
#  organisation_level :integer          default(0)
#  hierarchy          :string(25)
#  status_id          :integer          not null
#  parent_id          :integer          not null
#  external_reference :string(100)
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :organisation do
    playground_id           -1 
    code              "TEST" 
    description       "Organisation used for unit testing" 
    name              "Test Organisation"
    owner_id          -1
    status_id         -1
    created_by "Fred"
    updated_by "Fred"
  end
end
