# == Schema Information
#
# Table name: business_areas
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  PCF_index     :string(255)
#  PCF_reference :string(255)
#  status_id     :integer
#  owner_id      :integer
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class BusinessArea < ActiveRecord::Base

### scope

  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_hierarchy

	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :PCF_index, length: { maximum: 30 }
	validates :PCF_reference, length: { maximum: 30 }
	belongs_to :playground
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	has_many :business_flows
	has_many :business_objects

### private functions definitions
  private

  ### before filters
    def set_hierarchy
      if BusinessArea.where("playground_id = ?", self.playground_id).count == 0 
        self.hierarchy = self.playground.hierarchy + '.001'
      else 
        last_one = BusinessArea.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
