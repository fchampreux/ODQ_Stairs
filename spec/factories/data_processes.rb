# == Schema Information
#
# Table name: data_processes
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  scope_id           :integer
#  business_object_id :integer
#  status_id          :integer
#  last_run_at        :datetime
#  next_run_at        :datetime
#  last_run_end       :datetime
#  duration           :decimal(, )
#  loaded             :integer
#  inserted           :integer
#  updated            :integer
#  deleted            :integer
#  rejected           :integer
#  owner_id           :integer
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

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
