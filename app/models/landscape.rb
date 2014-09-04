# == Schema Information
#
# Table name: landscapes
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  status_id     :integer
#  owner_id      :integer
#  all_records   :integer
#  bad_records   :integer
#  score         :integer
#  odq_unique_id :integer
#  odq_object_id :integer
#

class Landscape < ActiveRecord::Base
extend SimpleSearch

self.sequence_name = "global_seq"

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
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	has_many :scopes
        belongs_to :playground									# scopes the odq_object_id calculation
        acts_as_sequenced scope: :playground_id, column: :odq_object_id				#

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
