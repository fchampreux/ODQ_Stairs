# == Schema Information
#
# Table name: playgrounds
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(200)      not null
#  description   :text
#  hierarchy     :string(25)
#  status_id     :integer          not null
#  all_records   :integer          default(0)
#  bad_records   :integer          default(0)
#  score         :integer          default(0)
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

#FactoryBot.factories.clear
FactoryBot.define do
  factory :playground do
    playground_id       0
    name                "Test Playground"
    code                "TEST_PG"
    description         "This is a test Playground used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
    owner_id            1
    status_id           0
    end

end
