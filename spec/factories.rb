FactoryGirl.define do
  factory :user do
    first_name    "Michael"
    last_name     "Hartl"
    login    "micha"
    password "foobar"
    password_confirmation "foobar"
  end
end

