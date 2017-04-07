# == Schema Information
#
# Table name: values_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  owner_id      :integer
#  table_name    :string(255)
#  software_id   :integer
#  software_name :string(255)
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
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
