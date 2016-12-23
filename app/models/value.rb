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

### id generation	
  self.sequence_name = "objects_seq"

### scope
#  Value is linked to a list which belongs to the correct scope

### before filter

### validation
	validates :code, length: { maximum: 100 }
	validates :caption, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, presence:true, length: { maximum: 1000 }
#        belongs_to :playground									# scopes the odq_object_id calculation
#        acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
  belongs_to :values_list
  validates :values_list, presence: true

### private functions definitions
  private
  
	### before filters
	def set_playground 
		self.playground_id = self.values_list.playground_id
	end 



end


