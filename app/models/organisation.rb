# == Schema Information
#
# Table name: organisations
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  code               :string(255)
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  hierarchy          :string(255)
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  status_id          :integer
#  owner_id           :integer
#  parent_id          :integer
#

class Organisation < ActiveRecord::Base

### before filter
  before_create :set_code
  before_create :set_hierarchy

	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :organisation_level, presence: true
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
        belongs_to :organisation, :class_name => "Organisation", :foreign_key => "parent_organisation_id"	# helps retrieving the status name
        has_many :organisations


### private functions definitions
  private

  ### before filters
    def set_code
      if Organisation.count > 0 
        self.code = self.organisation.code + '-' + code
      end
    end 

    def set_hierarchy
      if Organisation.count == 0 
        self.hierarchy = self.playground_id.to_s + '.001'
      else 
        last_one = Organisation.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

end
