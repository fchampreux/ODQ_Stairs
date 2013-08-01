# == Schema Information
#
# Table name: data_policies
#
#  id                  :integer          not null, primary key
#  playground_id       :integer
#  landscape_id        :integer
#  code                :string(255)
#  name                :string(255)
#  description         :text
#  organisations_list  :text
#  territories_list    :text
#  business_rules_list :text
#  date_limitations    :text
#  policy_matrix       :text
#  status_id           :string(255)
#  owner_id            :string(255)
#  active_from         :datetime
#  active_to           :datetime
#  scope_id            :integer
#  business_process_id :integer
#  approver_id         :integer
#  approved_at         :datetime
#  created_by          :string(255)
#  updated_by          :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class DataPolicy < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
end
