# == Schema Information
#
# Table name: parameters_lists
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  created_by       :string(255)
#  updated_by       :string(255)
#  owner_id         :integer
#  is_user_specific :boolean
#  created_at       :datetime
#  updated_at       :datetime
#

class ParametersList < ActiveRecord::Base


### before filter
  before_create :set_code

### validation
	validates :code, length: { maximum: 100 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :playground_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
        has_many :parameters

### private functions definitions
  private

  ### before filters
    def set_code 
      self.code = name.gsub(/[^0-9A-Za-z]/, '_').upcase
    end 

end
