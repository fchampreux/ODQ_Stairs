# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parameter do
    playground_id 1
    is_list false
    parent_list_id 1
    code "MyString"
    name "MyString"
    description "MyText"
    parameter_index 1
    parameter_caption "MyString"
    active_from "2013-10-12 16:37:46"
    active_to "2013-10-12 16:37:46"
    created_by "MyString"
    updated_by "MyString"
  end
end
