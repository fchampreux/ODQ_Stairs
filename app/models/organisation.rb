# == Schema Information
#
# Table name: organisations
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  code               :string(60)       not null
#  name               :string(100)      not null
#  description        :text
#  organisation_level :integer          default(0)
#  hierarchy          :string(25)
#  status_id          :integer          not null
#  parent_id          :integer          not null
#  external_reference :string(100)
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Organisation < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_validation :set_hierarchy
  before_create :set_code

	validates :code, presence: true, length: { maximum: 10 }
	validates :name, presence: true, uniqueness: {scope: :playground_id, case_sensitive: false}, length: { minimum: 2, maximum: 100 }
#	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 25 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :parent_id, presence: true
#	validates :playground, presence: true
	belongs_to :playground								
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"		# helps retrieving the status name
        belongs_to :parent_org, :class_name => "Organisation", :foreign_key => "parent_id"	# helps retrieving the parent name
        has_many :child_orgs, :class_name => "Organisation" , :foreign_key => "parent_id"	# link to the child oreganisation


### private functions definitions
  private

  ### before filters
    def set_code
      if Organisation.count > 1			#Undefined organisation exists, but is a parent for none  
        self.code = self.parent_org.code + '-' + code
        self.organisation_level = self.parent_org.organisation_level + 1
      end
    end 

    def set_hierarchy
      if Organisation.where("playground_id = ?", self.playground_id).count == 0 
        self.hierarchy = self.playground.hierarchy + '.001' 
      else if Organisation.where("parent_id = ?", self.parent_id).count == 0 
        self.hierarchy = self.parent_org.hierarchy + '.001'
      else 
        last_one = Organisation.where("parent_id = ?", self.parent_id).maximum("hierarchy")
        self.hierarchy = last_one.next
      end
      end
    end

end
