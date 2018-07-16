# == Schema Information
#
# Table name: scopes
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  landscape_id       :integer          not null
#  code               :string(60)       not null
#  name               :string(200)      not null
#  load_interface     :string(100)
#  organisation_level :integer
#  territory_level    :integer
#  business_object_id :integer
#  hierarchy          :string(25)       not null
#  status_id          :integer          not null
#  all_records        :integer          default(0)
#  bad_records        :integer          default(0)
#  score              :integer          default(0)
#  db_technology      :string(30)
#  db_connection      :string(200)
#  db_owner_schema    :string(30)
#  structure_name     :string(50)
#  description        :text
#  sql_query          :text
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#FactoryBot.factories.clear
FactoryBot.define do
  factory :scope do
    playground_id       0
    landscape_id        0
    name                "Test Scope"
    code                "TEST_SC"
    description         "This is a test Scope used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
    owner_id            1
    status_id           0
    end

end
