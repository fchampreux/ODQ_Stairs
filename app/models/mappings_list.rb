# == Schema Information
#
# Table name: mappings_lists
#
#  id             :integer          not null, primary key
#  playground_id  :integer          not null
#  code           :string(60)       not null
#  name           :string(100)      not null
#  description    :text
#  source_list_id :integer          not null
#  target_list_id :integer          not null
#  owner_id       :integer          not null
#  created_by     :string(100)      not null
#  updated_by     :string(100)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class MappingsList < ActiveRecord::Base
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code

### after filter
  after_create :build_mappings

### validation
  validates :name, presence: true, uniqueness: {scope: :playground_id, case_sensitive: false}, length: { minimum: 2, maximum: 100 }
 	validates :code, presence: true, uniqueness: {scope: :playground_id, case_sensitive: false}, length: { maximum: 60 }
  validates :description, length: { maximum: 1000 }
  validates :created_by , presence: true
  validates :updated_by, presence: true
  validates :owner_id, presence: true
  validates :playground, presence: true 
  validates :source_list, presence: true
  validates :target_list, presence: true
  belongs_to :playground
  belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the owner name
  belongs_to :source_list, :class_name => "ValuesList", :foreign_key => "source_list_id"	# helps retrieving the source list name
  belongs_to :target_list, :class_name => "ValuesList", :foreign_key => "target_list_id"	# helps retrieving the target list name
  has_many :mappings, :dependent => :destroy
  accepts_nested_attributes_for :mappings

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = "#{source_list.code}_TO_#{target_list.code}"
    end 

  ### after filters
    def build_mappings
      self.source_list.values.each do |mapping_value|
        self.mappings.build(:playground_id => self.playground_id,
                            :source_software => mapping_value.values_list.software_name,
                            :source_table => mapping_value.values_list.table_name,
                            :source_code => mapping_value.code,
                            :source_property => mapping_value.property,
                            :target_software => self.target_list.software_name,
                            :target_table => self.target_list.table_name,
                            :created_by => self.created_by,
                            :updated_by => self.updated_by,
                            :owner_id => self.owner_id)
      end
    end
   
end
