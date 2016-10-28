# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_object_id :integer
#  skill_size         :integer
#  skill_precision    :integer
#  skill_type_id      :integer
#  is_key             :boolean
#  is_published       :boolean
#

FactoryGirl.define do
  factory :column do
    id                  0
    business_object_id  0
    playground_id       1
    name                "test_column"
    description         "This is a test column used for unit testing"
    column_type         "VARCHAR"
    size                100
    is_key              false
    created_by          "Fred"
    updated_by          "Fred"
    session_id          "TestRun-01"
    end

end
