FactoryGirl.define do
  factory :user do
    playground_id 1
    default_playground_id 1
    active_from "2001-01-01"
    active_to "2001-01-01"
    last_name "Michael"
    login "Michael"
    email "Michael.Hartl@free.fr"
    password "foobar"
    password_confirmation "foobar"
  end
end

