# == Schema Information
#
# Table name: parameters
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  is_list       :boolean
#  name          :string(255)
#  description   :text
#  active_from   :datetime
#  active_to     :datetime
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  parent_list   :string(255)
#  code          :string(255)
#

class Parameter < ActiveRecord::Base

### before filter
  before_save :set_code

### validation
	validates :code, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :parent_list, length: { maximum: 100 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :active_from, presence: true
	validates :active_to, presence: true
	validates :playground_id, presence: true

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = parent_list.gsub(/[^0-9A-Za-z]/, '_').upcase
    end 

end


