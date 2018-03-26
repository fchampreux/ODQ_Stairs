# == Schema Information
#
# Table name: mappings
#
#  id               :integer          not null, primary key
#  playground_id    :integer          not null
#  mappings_list_id :integer          not null
#  source_software  :string(100)
#  source_table     :string(100)
#  source_value_id  :string(100)
#  source_code      :string(100)
#  target_software  :string(100)
#  target_table     :string(100)
#  target_value_id  :string(100)
#  target_code      :string(100)
#  source_property  :string(100)
#  target_property  :string(100)
#  owner_id         :integer          not null
#  created_by       :string(100)      not null
#  updated_by       :string(100)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :mapping do
    playground_id             0
    mappings_list_id          0
    source_software           "Application"
    source_table              "Application" 
    source_code               "Application" 
    source_property           "Application" 
    target_software           "Application" 
    target_code               "Application" 
    target_table              "Application" 
    target_property           "Application"
    created_by                "Fred"
    updated_by                "Fred"
    owner_id                   1
  end
end
