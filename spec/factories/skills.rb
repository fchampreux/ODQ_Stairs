# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  name               :string(100)      not null
#  description        :text
#  business_object_id :integer          not null
#  skill_size         :integer
#  skill_precision    :integer
#  skill_type_id      :integer
#  is_key             :boolean          default(FALSE)
#  is_published       :boolean          default(FALSE)
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :skill do
    playground_id       0
    owner_id               1
    business_object_id  0
    name                "Test Skill"
    description         "This is a test skill used for unit testing"
    skill_type_id       0
    skill_size          100
    is_key              false
    is_published        false
    created_by          "Test"
    updated_by          "Test"
    end

end
