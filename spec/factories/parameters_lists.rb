# == Schema Information
#
# Table name: parameters_lists
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  owner_id         :integer
#  is_user_specific :boolean
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :parameters_list do
    playground_id             -1
    name                      "Test Parameters list"
    description               "This is a Test Parameters list for unit testing"
    created_by "Fred"
    updated_by "Fred"
  end
end
