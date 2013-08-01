# == Schema Information
#
# Table name: business_rules
#
#  id                   :integer          not null, primary key
#  playground_id        :integer
#  code                 :string(255)
#  name                 :string(255)
#  description          :text
#  business_value       :text
#  hierarchy            :string(255)
#  status_id            :integer
#  owner_id             :integer
#  check_description    :text
#  check_script         :text
#  correction_method    :text
#  correction_script    :text
#  correction_batch     :string(255)
#  white_list           :text
#  rule_type            :string(255)
#  condition            :text
#  complexity           :decimal(, )
#  added_value          :decimal(, )
#  severity             :decimal(, )
#  maintenance_cost     :decimal(, )
#  maintenance_duration :decimal(, )
#  version              :string(255)
#  approver_id          :integer
#  approved_at          :datetime
#  business_process_id  :integer
#  business_object_id   :integer
#  created_by           :string(255)
#  updated_by           :string(255)
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class BusinessRule < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true

	belongs_to :business_object
	belongs_to :business_process
end

