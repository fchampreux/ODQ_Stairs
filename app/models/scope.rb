# == Schema Information
#
# Table name: scopes
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  landscape_id       :integer
#  code               :string(255)
#  name               :string(255)
#  load_interface     :string(255)
#  organisation_level :integer
#  territory_level    :integer
#  business_object_id :integer
#  hierarchy          :string(255)
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status_id          :integer
#  owner_id           :integer
#  all_records        :integer
#  bad_records        :integer
#  score              :integer
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  db_technology      :string(30)
#  db_connection      :string(200)
#  db_owner_schema    :string(30)
#  structure_name     :string(50)
#  description        :text
#  sql_query          :text
#

class Scope < ActiveRecord::Base
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
        belongs_to :playground									# scopes the odq_object_id calculation
        acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	belongs_to :business_object							# helps retrieving the target business object
#	validates :organisation_level, presence: true
	belongs_to :landscape

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.landscape.code + '-' + code
    end 

    def set_hierarchy
      if Scope.where("landscape_id = ?", self.landscape_id).count == 0 
        self.hierarchy = self.landscape.hierarchy + '.001'
      else 
        last_one = Scope.pgnd(self.playground_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
