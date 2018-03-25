# == Schema Information
#
# Table name: parameters_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class ParametersList < ActiveRecord::Base
extend CsvHelper

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter
  before_create :set_code

### validation
	validates :code, presence: true, uniqueness: true,length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :playground_id, presence: true
#	validates :playground, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
  has_many :parameters, :inverse_of => :parameters_list, :dependent => :destroy 
  accepts_nested_attributes_for :parameters, :reject_if => :all_blank, :allow_destroy => true

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = name.gsub(/[^0-9A-Za-z]/, '_').upcase
    end 

end
