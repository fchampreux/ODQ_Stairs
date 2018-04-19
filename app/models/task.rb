# == Schema Information
#
# Table name: tasks
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  activity_id        :integer          not null
#  code               :string(60)       not null
#  name               :string(100)      not null
#  description        :text
#  hierarchy          :string(25)       not null
#  pcf_index          :string(30)
#  pcf_reference      :string(100)
#  software_id        :integer
#  external_reference :string(100)
#  status_id          :integer          not null
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Task < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_validation :set_hierarchy
  before_create :set_code

	validates :code, presence: true, length: { maximum: 60 }
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 100 }
	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :activity_id, presence: true
	validates :pcf_index, length: { maximum: 30 }
	validates :pcf_reference, length: { maximum: 100 }
	validates :activity, presence: true
  belongs_to :playground								
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	belongs_to :activity

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.activity.code + '-' + code
    end 

    def set_hierarchy
      if Task.where("activity_id = ?", self.activity_id).count == 0 
        self.hierarchy = self.activity.hierarchy + '.001'
      else 
        last_one = Task.pgnd(self.playground_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
