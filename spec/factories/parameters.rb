# == Schema Information
#
# Table name: parameters
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  parameters_list_id :integer          not null
#  name               :string(100)      not null
#  description        :text
#  active_from        :datetime         not null
#  active_to          :datetime         not null
#  parent_list        :string(100)
#  code               :string(10)       not null
#  property           :string(30)       not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
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
