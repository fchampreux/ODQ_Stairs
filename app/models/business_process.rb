# == Schema Information
#
# Table name: business_processes
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  business_flow_id :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  hierarchy        :string(255)
#  pcf_index        :string(255)
#  pcf_reference    :string(255)
#  status_id        :integer
#  owner_id         :integer
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  all_records      :integer
#  bad_records      :integer
#  score            :integer
#  odq_unique_id    :integer
#  odq_object_id    :integer
#



class BusinessProcess < ActiveRecord::Base
extend SimpleSearch

### id generation
  self.sequence_name = "objects_seq"

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

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
	validates :business_flow_id, presence: true
	validates :pcf_index, length: { maximum: 30 }
	validates :pcf_reference, length: { maximum: 30 }
	validates :business_flow, presence: true
 #       belongs_to :playground									# scopes the odq_object_id calculation
 #       acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	belongs_to :business_flow
	has_many :business_rules
    
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
