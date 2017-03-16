# == Schema Information
#
# Table name: values_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  owner_id      :integer
#  table_name    :string(255)
#  software_id   :integer
#  software_name :string(255)
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ValuesList < ActiveRecord::Base
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code

### validation
	validates :code, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :playground_id, presence: true
	# validates :playground, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :software, :class_name => "Parameter", :foreign_key => "software_id"	# helps retrieving the software name
  has_many :values, :inverse_of => :values_list, :dependent => :destroy 
  accepts_nested_attributes_for :values, :reject_if => :all_blank, :allow_destroy => true
        has_many :mappings_lists

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = name.gsub(/[^0-9A-Za-z]/, '_').upcase
      self.software_name = self.software.name
    end 

end
