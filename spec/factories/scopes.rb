# == Schema Information
#
# Table name: scopes
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  landscape_id       :integer
#  code               :string(255)
#  name               :string(255)
#  load_interface     :string(255)
#  organisation_level :integer
#  territory_level    :integer
#  business_object_id :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  all_records        :integer
#  bad_records        :integer
#  score              :integer
#  db_technology      :string(30)
#  db_connection      :string(200)
#  db_owner_schema    :string(30)
#  structure_name     :string(50)
#  description        :text
#  sql_query          :text
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#


#FactoryBot.factories.clear
FactoryBot.define do
  factory :scope do
    playground_id       1000000
    landscape_id        -1
    name                "Test Scope"
    code                "TEST_SC"
    description         "This is a test Scope used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
#    session_id          "TestRun-01"
    owner_id            1
    status_id           0
    end

end
