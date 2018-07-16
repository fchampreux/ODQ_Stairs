# == Schema Information
#
# Table name: scopes
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  landscape_id       :integer          not null
#  code               :string(60)       not null
#  name               :string(200)      not null
#  load_interface     :string(100)
#  organisation_level :integer
#  territory_level    :integer
#  business_object_id :integer
#  hierarchy          :string(25)       not null
#  status_id          :integer          not null
#  all_records        :integer          default(0)
#  bad_records        :integer          default(0)
#  score              :integer          default(0)
#  db_technology      :string(30)
#  db_connection      :string(200)
#  db_owner_schema    :string(30)
#  structure_name     :string(50)
#  description        :text
#  sql_query          :text
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Scope < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :code, presence: true, uniqueness: {scope: :landscape_id}, length: { maximum: 60 }
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 200 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :landscape, presence: true
  belongs_to :playground									
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
