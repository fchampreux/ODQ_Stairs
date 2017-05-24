# == Schema Information
#
# Table name: values
#
#  id             :integer          not null, primary key
#  playground_id  :integer
#  values_list_id :integer
#  name           :string(255)
#  description    :text
#  code           :string(255)
#  caption        :string(255)
#  created_by     :string(255)
#  updated_by     :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Value < ActiveRecord::Base
extend CsvHelper

### scope
#  Value is linked to a list which belongs to the correct scope

### before filter
before_create :set_playground
before_update :set_updated_by

### validation
  validates :code, length: { maximum: 100 }
  validates :caption, length: { maximum: 100 }
  validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
  validates :description, presence:true, length: { maximum: 1000 }
  validates :values_list_id, presence: true
  belongs_to :values_list

### private functions definitions
  private
  
	### before filters
	def set_playground 
		self.playground_id = self.values_list.playground_id
	end 

    def set_updated_by
		self.updated_by = self.values_list.updated_by
	end

end


