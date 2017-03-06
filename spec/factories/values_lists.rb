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

FactoryGirl.define do
  factory :values_list do
    playground_id           -1 
    code              "Application" 
    description       "Application" 
    name              "Application" 
    created_by "Fred"
    updated_by "Fred"
  end
end
