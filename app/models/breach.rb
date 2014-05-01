# == Schema Information
#
# Table name: update_requests
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  name             :string(255)
#  description      :text
#  current_values   :text
#  proposed_values  :text
#  business_rule_id :integer
#  record_id        :integer
#  organisation_id  :integer
#  territory_id     :integer
#  status_id        :integer
#  is_whitelisted   :boolean
#  requested_by_id  :integer
#  requested_to_id  :integer
#  opened_at        :date
#  expected_at      :date
#  closed_at        :date
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#


#

class Breach < ActiveRecord::Base
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validations
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :requested_by, :class_name => "User", :foreign_key => "requested_by_id"	# helps retrieving the owner name
	belongs_to :requested_to, :class_name => "User", :foreign_key => "requested_to_id"	# helps retrieving the approver name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"		# helps retrieving the status name
        belongs_to :business_rule
end


