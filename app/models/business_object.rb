# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_area_id   :integer
#  all_records        :integer
#  bad_records        :integer
#  score              :integer
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  main_scope_id      :integer
#  code               :string(255)
#

class BusinessObject < ActiveRecord::Base
extend SimpleSearch

self.sequence_name = "global_seq"

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code
  before_create :set_hierarchy

  validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 100 }
  validates :description, length: { maximum: 1000 }
  validates :created_by , presence: true
  validates :updated_by, presence: true
  validates :owner_id, presence: true
  validates :status_id, presence: true
  validates :playground_id, presence: true
  validates :business_area_id, presence: true
  belongs_to :playground									# scopes the odq_object_id calculation
  acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
  belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
  belongs_to :business_area
  has_many :business_rules
  has_many :skills, :inverse_of => :business_object, :dependent => :destroy
#  has_many :skills_imports
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

end
