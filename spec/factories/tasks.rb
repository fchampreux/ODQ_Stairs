# == Schema Information
#
# Table name: tasks
#
#  id                 :integer          not null
#  playground_id      :integer          not null
#  todo_type          :string
#  todo_id            :bigint(8)
#  code               :string(60)       not null
#  name               :string(200)      not null
#  description        :text
#  hierarchy          :string(25)       not null
#  pcf_index          :string(30)
#  pcf_reference      :string(100)
#  script             :text
#  language_id        :integer          default(0)
#  software_id        :integer
#  external_reference :string(100)
#  status_id          :integer          not null
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :task do
    activity_id         0
    playground_id       0
    name                "Test Task"
    code                "TEST_TASK"
    description         "This is a test Task used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    owner_id            1
    status_id           0
      
  end
end
