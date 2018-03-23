# == Schema Information
#
# Table name: business_flows
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  business_area_id :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  hierarchy        :string(255)
#  pcf_index        :string(255)
#  pcf_reference    :string(255)
#  status_id        :integer
#  owner_id         :integer
#  all_records      :integer
#  bad_records      :integer
#  score            :integer
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Activity < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
	validates :hierarchy, presence: true, uniqueness: true
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :business_process_id, presence: true
	validates :pcf_index, length: { maximum: 30 }
	validates :pcf_reference, length: { maximum: 30 }
	validates :business_process, presence: true
  belongs_to :playground								
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	belongs_to :business_process
	has_many :tasks, :inverse_of => :activity, :dependent => :destroy 
  accepts_nested_attributes_for :tasks, :reject_if => :all_blank, :allow_destroy => true

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.business_process.code + '-' + code
    end 

    def set_hierarchy
      if Activity.where("business_process_id = ?", self.business_process_id).count == 0 
        self.hierarchy = self.business_process.hierarchy + '.001'
      else 
        last_one = Activity.pgnd(self.playground_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
