# == Schema Information
#
# Table name: user_roles
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  user_id       :integer
#  role_id       :string(255)
#  active_from   :datetime
#  active_to     :datetime
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class User_role < ActiveRecord::Base
	validates :user_id, presence: true
	validates :role_id, presence: true
end
