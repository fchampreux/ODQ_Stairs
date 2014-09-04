# == Schema Information
#
# Table name: values
#
#  id             :integer          not null, primary key
#  playground_id  :integer
#  values_list_id :integer
#  name           :string(255)
#  description    :text
#  value_code     :string(255)
#  value_caption  :string(255)
#  created_by     :string(255)
#  updated_by     :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  odq_unique_id  :integer
#  odq_object_id  :integer
#



class Value < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validation
	validates :value_code, length: { maximum: 100 }
	validates :value_caption, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, presence:true, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :playground_id, presence: true
        belongs_to :playground									# scopes the odq_object_id calculation
        acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
	validates :playground, presence: true						# validates that the playground exists
        belongs_to :values_list

### private functions definitions
  private


end


