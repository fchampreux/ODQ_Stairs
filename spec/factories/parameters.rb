# == Schema Information
#
# Table name: parameters
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  active_from        :datetime
#  active_to          :datetime
#  parent_list        :string(255)
#  param_value        :string(255)
#  parameters_list_id :integer
#  param_code         :string(255)
#  owner_id           :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parameter do
    playground_id 1
    is_list false
    parent_list_id 1
    code "MyString"
    name "MyString"
    description "MyText"
    parameter_index 1
    parameter_caption "MyString"
    active_from "2013-10-12 16:37:46"
    active_to "2013-10-12 16:37:46"
    created_by "MyString"
    updated_by "MyString"
  end
end
