# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  business_area_id   :integer          not null
#  main_scope_id      :integer
#  code               :string(60)       not null
#  name               :string(100)      not null
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(25)       not null
#  status_id          :integer          not null
#  owner_id           :integer          not null
#  all_records        :integer          default(0)
#  bad_records        :integer          default(0)
#  score              :integer          default(0)
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class BusinessObject < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_validation :set_hierarchy
  before_create :set_code

	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :code, presence: true, length: { maximum: 10 }
	validates :name, presence: true, uniqueness: {scope: :playground_id}, length: { minimum: 2, maximum: 200 }
  validates :description, length: { maximum: 1000 }
  validates :created_by , presence: true
  validates :updated_by, presence: true
  validates :owner_id, presence: true
  validates :status_id, presence: true
  validates :playground_id, presence: true
	validates :business_area, presence: true
  belongs_to :playground
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
  belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
  belongs_to :business_area
  has_many :business_rules
  has_many :skills, :inverse_of => :business_object, :dependent => :destroy
  belongs_to :main_scope, :class_name => "Scope", :foreign_key => "main_scope_id"
  accepts_nested_attributes_for :skills, :reject_if => :all_blank, :allow_destroy => true

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = self.business_area.code + '-' + code
    end 

    def set_hierarchy
      if BusinessObject.where("business_area_id = ?", self.business_area_id).count == 0 
        self.hierarchy = self.business_area.hierarchy + '.001'
      else 
        last_one = BusinessObject.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
    end

=begin
    def self.to_csv
    CSV.generate(:col_sep => ";") do |csv| #Could accept a separator option
				csv << column_names
				all.each do |column|
					csv << column.attributes.values_at(*column_names)
				end
			end
		end
=end

end
