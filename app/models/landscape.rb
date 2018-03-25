# == Schema Information
#
# Table name: landscapes
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  hierarchy     :string(25)       not null
#  status_id     :integer          not null
#  all_records   :integer          default(0)
#  bad_records   :integer          default(0)
#  score         :integer          default(0)
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Landscape < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :code, presence: true, uniqueness: {scope: :playground_id}, length: { maximum: 60 }
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
 	validates :playground, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	has_many :scopes
  belongs_to :playground

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.playground.code + '-' + code
    end 

    def set_hierarchy
      if Landscape.where("playground_id = ?", self.playground_id).count == 0 
        self.hierarchy = self.playground.hierarchy + '.001'
      else 
        last_one = Landscape.pgnd(self.playground_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
