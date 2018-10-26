# == Schema Information
#
# Table name: business_rules
#
#  id                     :integer          not null
#  playground_id          :integer          not null
#  business_process_id    :integer          not null
#  business_object_id     :integer
#  code                   :string(60)       not null
#  name                   :string(200)      not null
#  description            :text
#  major_version          :integer          not null
#  minor_version          :integer          not null
#  is_finalised           :boolean          default(FALSE)
#  is_current             :boolean          default(TRUE)
#  business_value         :text
#  hierarchy              :string(25)       not null
#  check_description      :text
#  check_script           :text
#  check_language_id      :integer          default(0)
#  correction_method      :text
#  correction_script      :text
#  correction_language_id :integer          default(0)
#  correction_batch       :string(100)
#  white_list             :text
#  added_value            :integer          default(0)
#  maintenance_cost       :integer          default(0)
#  maintenance_duration   :integer          default(0)
#  rule_type_id           :integer          not null
#  severity_id            :integer          not null
#  complexity_id          :integer          not null
#  status_id              :integer          not null
#  owner_id               :integer          not null
#  all_records            :integer          default(0)
#  bad_records            :integer          default(0)
#  score                  :integer          default(0)
#  created_by             :string(100)      not null
#  updated_by             :string(100)      not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class BusinessRule < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### global identifier
   self.sequence_name = "global_seq"

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_validation :set_hierarchy
  before_create :set_code

	validates :playground_id, presence: true
	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :code, presence: true, length: { maximum: 10 } #Find a way to remove this test which fails at update
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 200 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :business_object, presence: true
	validates :business_process, presence: true
        belongs_to :playground
        belongs_to :parent, :class_name => "BusinessProcess", :foreign_key => "business_process_id" 
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the owner name
	belongs_to :approver, :class_name => "User", :foreign_key => "approver_id"		# helps retrieving the approver name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"		# helps retrieving the status name
	belongs_to :rule_type, :class_name => "Parameter", :foreign_key => "rule_type_id"	# helps retrieving the rule type name
	belongs_to :severity, :class_name => "Parameter", :foreign_key => "severity_id"		# helps retrieving the severity grade
	belongs_to :complexity, :class_name => "Parameter", :foreign_key => "complexity_id"	# helps retrieving the complexity grade
	belongs_to :business_object								# helps retrieving the target business object
	belongs_to :business_process
        has_many :breaches

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
        last_one = BusinessRule.pgnd(self.playground_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end
      
end

