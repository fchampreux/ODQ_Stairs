# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    playground_id 1
    name "MyString"
    description "MyText"
    created_by "MyString"
    updated_by "MyString"
    owner_id 1
    severity_id 1
    scope_id 1
    business_object_id 1
    odq_unique_id 1
    odq_object_id 1
    expected_at "2014-12-07 14:18:10"
    closed_at ""
    responsible_i 1
  end
end
