# == Schema Information
#
# Table name: breaches
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  business_rule_id   :integer
#  application_id     :integer
#  pk_values          :text
#  business_object_id :integer
#  record_id          :integer
#  period_id          :integer
#  organisation_id    :integer
#  territory_id       :integer
#  name               :string(255)
#  description        :text
#  breach_type_id     :integer
#  breach_status_id   :integer
#  message_source     :string(255)
#  object_name        :string(255)
#  error_message      :text
#  current_values     :text
#  proposed_values    :text
#  is_whitelisted     :boolean
#  opened_at          :datetime
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer
#  approver_id        :integer
#  approved_at        :datetime
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  record_updated_by  :string(255)
#  record_updated_at  :datetime
#  owner_id           :integer
#  is_identified      :boolean
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  notification_id    :integer
#


#

class Breach < ActiveRecord::Base
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
before_save :set_approver

### validations
	validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :breach_status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the requestor name
	belongs_to :responsible, :class_name => "User", :foreign_key => "responsible_id"	# helps retrieving the responible name
	belongs_to :approver, :class_name => "User", :foreign_key => "approver_id" 		# helps retrieving the approver name
	belongs_to :breach_status, :class_name => "Parameter", :foreign_key => "breach_status_id"	# helps retrieving the status name
	belongs_to :breach_type, :class_name => "Parameter", :foreign_key => "breach_type_id"	# helps retrieving the type name
	belongs_to :software, :class_name => "Parameter", :foreign_key => "application_id"	# helps retrieving the software name
	belongs_to :organisation								# helps retrieving the organisation dimension name
	belongs_to :territory									# helps retrieving the territory dimension name
	belongs_to :business_object								# helps retrieving the business object name
        belongs_to :business_rule
        belongs_to :notification
        belongs_to :playground									# scopes the odq_object_id calculation
        acts_as_sequenced scope: :playground_id, column: :odq_object_id				#

### private functions definitions
  private

  ### before filters
    def set_approver 
      if self.approver_id == nil
        self.approver_id = self.owner_id
      end
    end 
 


end


