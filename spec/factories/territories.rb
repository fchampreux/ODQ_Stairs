# == Schema Information
#
# Table name: territories
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  code               :string(255)
#  name               :string(255)
#  description        :text
#  territory_level    :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  parent_id          :integer
#  external_reference :string(255)
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :territory do
    playground_id           -1 
    code              "TEST" 
    description       "Territory used for unit testing" 
    name              "Test Territory"
    owner_id          -1
    status_id         -1
    created_by "Fred"
    updated_by "Fred"
  end
end
