# == Schema Information
#
# Table name: parameters
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  parameters_list_id :integer          not null
#  name               :string(100)      not null
#  description        :text
#  active_from        :datetime         not null
#  active_to          :datetime         not null
#  parent_list        :string(100)
#  code               :string(10)       not null
#  property           :string(30)       not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Parameter < ActiveRecord::Base
extend CsvHelper

### scope
#  Parameter is linked to a list which belongs to the correct scope

### before filter
  before_create :set_playground
  before_update :set_updated_by

### validation
	validates :code, length: { maximum: 100 }
	validates :property, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, presence: true, length: { maximum: 1000 }
	validates :active_from, presence: true
	validates :active_to, presence: true
	validates :parameters_list, presence: true
  belongs_to :parameters_list

### private functions definitions
  private

  ### before filters
    def set_playground 
      self.playground_id = self.parameters_list.playground_id
    end
    
    def set_updated_by
			self.updated_by = self.parameters_list.updated_by
		end

end


