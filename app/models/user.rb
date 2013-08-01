# == Schema Information
#
# Table name: users
#
#  id                    :integer          not null, primary key
#  playground_id         :integer
#  default_playground_id :integer
#  current_playground_id :integer
#  current_landscape_id  :integer
#  directory_id          :string(255)
#  login                 :string(255)
#  email                 :string(255)
#  first_name            :string(255)
#  last_name             :string(255)
#  description           :text
#  active_from           :datetime
#  active_to             :datetime
#  is_admin              :boolean
#  password_digest       :string(255)
#  remember_token        :string(255)
#  created_by            :string(255)
#  updated_by            :string(255)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class User < ActiveRecord::Base
        has_secure_password
	validates :login, presence: true, uniqueness: true

  before_save { |user| user.login = login.downcase }
  before_save :create_remember_token

private
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end

end
