# == Schema Information
#
# Table name: mappings_lists
#
#  id             :integer          not null, primary key
#  playground_id  :integer          not null
#  code           :string(60)       not null
#  name           :string(100)      not null
#  description    :text
#  source_list_id :integer          not null
#  target_list_id :integer          not null
#  owner_id       :integer          not null
#  created_by     :string(100)      not null
#  updated_by     :string(100)      not null
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
