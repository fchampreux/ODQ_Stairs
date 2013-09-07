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
  before_save { self.email = email.downcase }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }      

  validates :playground_id, presence: true
  validates :default_playground_id, presence: true
  validates :active_from, presence: true
  validates :active_to, presence: true
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :login, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :directory_id, length: { maximum: 100 }
  validates :first_name, length: { maximum: 100 }
  validates :password_digest, length: { maximum: 100 }
  validates :remember_token, length: { maximum: 100 }
  validates :created_by, length: { maximum: 30 }
  validates :updated_by, length: { maximum: 30 }

  has_secure_password
  validates :password, length: { minimum: 6 }

end
