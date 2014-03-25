# == Schema Information
#
# Table name: mappings_lists
#
#  id             :integer          not null, primary key
#  playground_id  :integer
#  code           :string(255)
#  name           :string(255)
#  description    :text
#  created_by     :string(255)
#  updated_by     :string(255)
#  owner_id       :integer
#  source_list_id :integer
#  target_list_id :integer
#  created_at     :datetime
#  updated_at     :datetime
#


class MappingsList < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code

### after filter
  after_create :build_mappings

### validation
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
#	validates :code, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :playground_id, presence: true
        belongs_to :playground
	validates :playground, presence: true							# validates that the playground exists
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
        self.mappings.build(:playground_id => self.playground_id, :source_software => mapping_value.values_list.software_name, :source_table => mapping_value.values_list.table_name, :source_code => mapping_value.value_code, :source_caption => mapping_value.value_caption, :target_software => self.target_list.software_name, :target_table => self.target_list.table_name, :created_by => self.created_by, :updated_by => self.updated_by)
      end
    end
   
end
