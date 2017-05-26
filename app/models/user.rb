# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  playground_id          :integer
#  default_playground_id  :integer
#  current_playground_id  :integer
#  current_landscape_id   :integer
#  directory_id           :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  name                   :string(255)
#  language               :string
#  description            :text
#  active_from            :datetime
#  active_to              :datetime
#  is_admin               :boolean
#  created_by             :string(255)
#  updated_by             :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  language_id            :integer
#  user_name              :string
#

class User < ActiveRecord::Base
  
  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
  
  before_create :set_default_values
  before_save :email_format
  before_save :name_update
=begin
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :playground_id, presence: true
  validates :default_playground_id, presence: true
  validates :active_from, presence: true
  validates :active_to, presence: true
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :user_name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true, length: { maximum: 100 }, format: { with: VALID_EMAIL_REGEX }
  validates :directory_id, length: { maximum: 100 }
  validates :first_name, length: { maximum: 100 }
  validates :created_by, length: { maximum: 30 }
  validates :updated_by, length: { maximum: 30 }
=end

### private functions definitions
  private

  ### before filters
    def set_default_values
      self.playground_id = 1000000
      self.default_playground_id = 1000000
      self.current_playground_id = 1000000
#      self.current_landscape_id = 1000000
      self.active_from = Time.now
      self.active_to = Time.now
    end
      
    def email_format
      self.email = email.downcase 
    end

    def name_update
      self.name = "#{first_name} #{last_name}"
     end
    
    def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions.to_h).where(["lower(user_name) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      elsif conditions.has_key?(:user_name) || conditions.has_key?(:email)
        where(conditions.to_h).first
      end
    end

end
