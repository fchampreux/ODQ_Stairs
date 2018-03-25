# == Schema Information
#
# Table name: values
#
#  id             :integer          not null, primary key
#  playground_id  :integer          not null
#  values_list_id :integer          not null
#  code           :string(60)       not null
#  name           :string(100)      not null
#  description    :text
#  property       :string(100)
#  created_by     :string(100)      not null
#  updated_by     :string(100)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
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
