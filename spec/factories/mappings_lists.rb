# == Schema Information
#
# Table name: mappings_lists
#
#  id             :integer          not null, primary key
#  playground_id  :integer
#  code           :string(255)
#  name           :string(255)
#  description    :text
#  created_by     :string(255)
#  updated_by     :string(255)
#  owner_id       :integer
#  source_list_id :integer
#  target_list_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryBot.define do
  factory :mappings_list do
    playground_id             -1
    name                      "Test Mappings list"
    description               "This is a Test Mappings list for unit testing"
    created_by "Fred"
    updated_by "Fred"
  end
end
