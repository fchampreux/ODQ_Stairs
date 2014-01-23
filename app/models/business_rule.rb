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
#  rule_type_id         :integer
#

class BusinessRule < ActiveRecord::Base

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :business_object_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the owner name
	belongs_to :approver, :class_name => "User", :foreign_key => "approver_id"		# helps retrieving the approver name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"		# helps retrieving the status name
	belongs_to :rule_type, :class_name => "Parameter", :foreign_key => "rule_type_id"	# helps retrieving the rule type name
	belongs_to :severity, :class_name => "Parameter", :foreign_key => "severity_id"		# helps retrieving the severity grade
	belongs_to :complexity, :class_name => "Parameter", :foreign_key => "complexity_id"	# helps retrieving the complexity grade
	belongs_to :business_object								# helps retrieving the target business object

	belongs_to :business_process

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.business_process.code + '-' + code
    end 

    def set_hierarchy
      if BusinessRule.where("business_process_id = ?", self.business_process_id).count == 0 
        self.hierarchy = self.business_process.hierarchy + '.001'
      else 
        last_one = BusinessRule.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end

