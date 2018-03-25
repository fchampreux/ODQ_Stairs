# == Schema Information
#
# Table name: business_processes
#
#  id               :integer          not null, primary key
#  playground_id    :integer          not null
#  business_flow_id :integer          not null
#  code             :string(60)       not null
#  name             :string(100)      not null
#  description      :text
#  hierarchy        :string(25)       not null
#  pcf_index        :string(30)
#  pcf_reference    :string(100)
#  status_id        :integer          not null
#  owner_id         :integer          not null
#  all_records      :integer          default(0)
#  bad_records      :integer          default(0)
#  score            :integer          default(0)
#  created_by       :string(100)      not null
#  updated_by       :string(100)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

#FactoryBot.factories.clear
FactoryBot.define do
  factory :business_process do
    business_flow_id    0
    playground_id       0
    name                "Test Business Process"
    code                "TEST_BP"
    description         "This is a test Business process used for unit testing"
    created_by          "Fred"
    updated_by          "Fred"
    hierarchy           "1.0"
    owner_id            1
    status_id           0
    end

end
