# == Schema Information
#
# Table name: business_areas
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(200)      not null
#  description   :text
#  hierarchy     :string(25)       not null
#  pcf_index     :string(30)
#  pcf_reference :string(100)
#  status_id     :integer          not null
#  owner_id      :integer          not null
#  all_records   :integer          default(0)
#  bad_records   :integer          default(0)
#  score         :integer          default(0)
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class BusinessArea < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope

  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_validation :set_hierarchy
  before_create :set_code

	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 25 }
	validates :code, presence: true, uniqueness: {scope: :playground_id}, length: { maximum: 20 }
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 200 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground, presence: true
	validates :pcf_index, length: { maximum: 30 }
	validates :pcf_reference, length: { maximum: 100 }
  belongs_to :playground
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	has_many :business_flows
	has_many :business_objects

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.playground.code + '-' + code
    end
  
    def set_hierarchy
      if BusinessArea.where("playground_id = ?", self.playground_id).count == 0 
        self.hierarchy = self.playground.hierarchy + '.001'
      else 
        last_one = BusinessArea.pgnd(self.playground_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
