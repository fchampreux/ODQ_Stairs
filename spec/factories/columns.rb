# == Schema Information
#
# Table name: columns
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  datatype           :string(20)       not null
#  size               :integer          not null
#  is_key             :boolean          default(FALSE), not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  session_id         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_object_id :integer
#  playground_id      :integer
#  is_published       :boolean
#  precision          :integer
#

FactoryGirl.factories.clear
FactoryGirl.define do
  factory :column do
    id                  0
    business_object_id  0
    playground_id       1
    name                "test_column"
    description         "This is a test column used for unit testing"
    type                "VARCHAR"
    size                100
    is_key              false
    created_by          "Fred"
    updated_by          "Fred"
    session_id          "TestRun-01"
    end

end
