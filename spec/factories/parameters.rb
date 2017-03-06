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
    playground_id             -1
    parameters_list_id        -1
    name                      "Test Parameter"
    description               "This is a Test Parameter for unit testing"
    active_from               "2001-01-01"
    active_to                 "2100-01-01"
    created_by "Fred"
    updated_by "Fred"
  end
end
