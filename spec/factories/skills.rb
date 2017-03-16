# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  name               :string(100)
#  description        :text
#  business_object_id :integer
#  skill_size         :integer
#  skill_precision    :integer
#  skill_type_id      :integer
#  is_key             :boolean
#  is_published       :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryGirl.define do
  factory :skill do
    business_object_id  -1
    name                "Test Skill"
    description         "This is a test skill used for unit testing"
    skill_type_id       -1
    skill_size          100
    is_key              false
    is_published              false
    end

end
