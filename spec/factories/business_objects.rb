# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  business_area_id   :integer          not null
#  main_scope_id      :integer
#  code               :string(60)       not null
#  name               :string(100)      not null
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(25)       not null
#  status_id          :integer          not null
#  owner_id           :integer          not null
#  all_records        :integer          default(0)
#  bad_records        :integer          default(0)
#  score              :integer          default(0)
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#FactoryBot.factories.clear
FactoryBot.define do
  factory :business_object do
    business_area_id    0
    playground_id       0
    name                "Test Business Object"
    code                "TEST_BO"
    description         "This is a test Business object used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
    owner_id            1
    status_id           0
    end

end
