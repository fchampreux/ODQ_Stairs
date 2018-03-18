# == Schema Information
#
# Table name: playgrounds
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  status_id     :integer
#  owner_id      :integer
#  all_records   :integer
#  bad_records   :integer
#  score         :integer
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#


#FactoryBot.factories.clear
FactoryBot.define do
  factory :playground do
    name                "Test Playground"
    code                "TEST_PG"
    description         "This is a test Playground used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
#    session_id          "TestRun-01"
    owner_id            1
    status_id           0
    end

end
