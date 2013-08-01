# == Schema Information
#
# Table name: roles
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :integer
#  role          :string(255)
#  active_from   :datetime
#  active_to     :datetime
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Role < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :role, presence: true, uniqueness: true
end
