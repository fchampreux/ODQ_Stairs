# == Schema Information
#
# Table name: business_hierarchies
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  pcf_index          :string
#  pcf_reference      :string
#  hierarchical_level :integer
#  hierarchy          :string
#  name               :string
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

FactoryBot.define do
  factory :business_hierarchy do
    PCFindex "MyString"
    hierarchy "MyString"
    name "MyString"
    description "MyText"
  end
end
