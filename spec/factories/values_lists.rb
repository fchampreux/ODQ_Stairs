# == Schema Information
#
# Table name: values_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  table_name    :string(100)
#  software_id   :integer
#  software_name :string(100)
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :values_list do
    playground_id           -1 
    code              "Application" 
    description       "Application" 
    name              "Application" 
    created_by "Fred"
    updated_by "Fred"
  end
end
