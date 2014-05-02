# == Schema Information
#
# Table name: breaches
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  current_values     :text
#  proposed_values    :text
#  business_rule_id   :integer
#  record_id          :integer
#  period_id          :integer
#  organisation_id    :integer
#  territory_id       :integer
#  is_whitelisted     :boolean
#  opened_at          :date
#  expected_at        :date
#  closed_at          :date
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  pk_values          :text
#  business_object_id :integer
#  responsible_id     :integer
#  requestor_id       :integer
#  approver_id        :integer
#  approved_at        :datetime
#  breach_type_id     :integer
#  message_source     :string(255)
#  application_id     :integer
#  object_name        :string(255)
#  observation        :text
#  error_message      :text
#  breach_status_id   :integer
#


#

class Breach < ActiveRecord::Base
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validations
	validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :breach_status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :requestor, :class_name => "User", :foreign_key => "requestor_id"		# helps retrieving the requestor name
	belongs_to :responsible, :class_name => "User", :foreign_key => "responsible_id"	# helps retrieving the responible name
	belongs_to :approver, :class_name => "User", :foreign_key => "approver_id" 		# helps retrieving the approver name
	belongs_to :breach_status, :class_name => "Parameter", :foreign_key => "breach_status_id"	# helps retrieving the status name
	belongs_to :breach_type, :class_name => "Parameter", :foreign_key => "breach_type_id"	# helps retrieving the type name
	belongs_to :software, :class_name => "Parameter", :foreign_key => "application_id"	# helps retrieving the software name
	belongs_to :organisation								# helps retrieving the organisation dimension name
	belongs_to :territory									# helps retrieving the territory dimension name
	belongs_to :business_object								# helps retrieving the business object name
        belongs_to :business_rule
end


