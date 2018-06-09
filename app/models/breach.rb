# == Schema Information
#
# Table name: breaches
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  business_rule_id   :integer          not null
#  application_id     :integer          not null
#  pk_values          :text             not null
#  business_object_id :integer          not null
#  record_id          :integer          not null
#  period_id          :integer          not null
#  organisation_id    :integer          not null
#  territory_id       :integer          not null
#  title              :string(100)
#  description        :text
#  breach_type_id     :integer          not null
#  breach_status_id   :integer          not null
#  message_source     :string(100)
#  object_name        :string(100)
#  error_message      :text
#  current_values     :text
#  proposed_values    :text
#  is_whitelisted     :boolean          default(FALSE)
#  opened_at          :datetime
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer
#  approver_id        :integer
#  approved_at        :datetime
#  record_updated_by  :string(100)
#  record_updated_at  :datetime
#  owner_id           :integer          not null
#  is_identified      :boolean          default(FALSE)
#  notification_id    :integer
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#

class Breach < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

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
 #       belongs_to :playground									# scopes the odq_object_id calculation
 #       acts_as_sequenced scope: :playground_id, column: :odq_object_id				#

### private functions definitions
  private

  ### before filters
    def set_approver 
      if self.approver_id == nil
        self.approver_id = self.owner_id
      end
    end 
 


end


