# == Schema Information
#
# Table name: parameters
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  active_from        :datetime
#  active_to          :datetime
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  parent_list        :string(255)
#  param_value        :string(255)
#  parameters_list_id :integer
#  param_code         :string(255)
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  owner_id           :integer
#

class Parameter < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validation
	validates :param_code, length: { maximum: 100 }
	validates :param_value, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, presence: true, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :active_from, presence: true
	validates :active_to, presence: true
	validates :playground_id, presence: true
        belongs_to :playground									# scopes the odq_object_id calculation
        acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
        belongs_to :parameters_list

### private functions definitions
  private

  ### before filters
    def set_code 
#      self.code = parent_list.gsub(/[^0-9A-Za-z]/, '_').upcase
    end 

end


