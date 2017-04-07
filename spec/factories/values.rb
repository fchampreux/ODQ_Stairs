# == Schema Information
#
# Table name: values
#
#  id             :integer          not null, primary key
#  playground_id  :integer
#  values_list_id :integer
#  name           :string(255)
#  description    :text
#  code           :string(255)
#  caption        :string(255)
#  created_by     :string(255)
#  updated_by     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :value do
    playground_id           -1
    values_list_id          -1 
    code              "Application" 
    description       "Application" 
    name              "Application" 
    caption           "Application"
    created_by "Fred"
    updated_by "Fred"
  end
end
