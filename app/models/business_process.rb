# == Schema Information
#
# Table name: business_processes
#
#  id               :integer          not null
#  playground_id    :integer          not null
#  business_flow_id :integer          not null
#  code             :string(60)       not null
#  name             :string(200)      not null
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

class BusinessProcess < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### global identifier
   self.sequence_name = "global_seq"

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_validation :set_hierarchy
  before_create :set_code

	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :code, presence: true, length: { maximum: 40 }
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 200 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :pcf_index, length: { maximum: 30 }
	validates :pcf_reference, length: { maximum: 100 }
	validates :business_flow, presence: true
	validates :playground_id, presence: true
        belongs_to :playground
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
        belongs_to :business_flow
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
        belongs_to :parent, :class_name => "BusinessFlow", :foreign_key => "business_flow_id"
        has_many :business_rules, :inverse_of => :business_process, :dependent => :destroy
	has_many :activities, :inverse_of => :business_process, :dependent => :destroy
    
### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.business_flow.code + '-' + code
    end 

    def set_hierarchy
      if BusinessProcess.where("business_flow_id = ?", self.business_flow_id).count == 0 
        self.hierarchy = self.business_flow.hierarchy + '.001'
      else 
        last_one = BusinessProcess.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
