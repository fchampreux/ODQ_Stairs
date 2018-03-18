# == Schema Information
#
# Table name: mappings
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  mappings_list_id :integer
#  source_software  :string(255)
#  source_table     :string(255)
#  source_value_id  :string(255)
#  source_code      :string(255)
#  target_software  :string(255)
#  target_table     :string(255)
#  target_value_id  :string(255)
#  target_code      :string(255)
#  created_by       :string(255)
#  updated_by       :string(255)
#  source_caption   :string(255)
#  target_caption   :string(255)
#  owner_id         :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :mapping do
    playground_id             -1
    mappings_list_id          -1
    source_software           "Application"
    source_table              "Application" 
    source_code               "Application" 
    source_caption            "Application" 
    target_software           "Application" 
    target_table              "Application" 
    target_caption            "Application"
    created_by "Fred"
    updated_by "Fred"
  end
end
