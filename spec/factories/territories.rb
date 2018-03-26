# == Schema Information
#
# Table name: territories
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  code               :string(60)       not null
#  name               :string(100)      not null
#  description        :text
#  territory_level    :integer
#  hierarchy          :string(100)
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
  factory :territory do
    playground_id      0
    code              "TEST" 
    description       "Territory used for unit testing" 
    name              "Test Territory"
    owner_id          0
    status_id         0
    parent_id         0
    hierarchy         '0'
    created_by "Fred"
    updated_by "Fred"
  end
end
