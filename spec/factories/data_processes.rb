# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :data_process do
    playground_id 1
    name "MyString"
    description "MyText"
    created_by "MyString"
    updated_by "MyString"
    owner_id 1
    scope_id 1
    business_object_id 1
    odq_unique_id 1
    odq_object_id 1
    last_run_at "2014-12-07 14:25:13"
    next_run_at ""
    status_id 1
    loaded 1
    inserted 1
    updated 1
    deleted 1
    rejected 1
    last_run_end "2014-12-07 14:25:13"
    duration "9.99"
  end
end
