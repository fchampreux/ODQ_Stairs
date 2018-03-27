# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  playground_id          :integer          not null
#  default_playground_id  :integer          default(1)
#  current_playground_id  :integer          default(1)
#  current_landscape_id   :integer          default(1)
#  external_directory_id  :string(100)
#  first_name             :string(100)
#  last_name              :string(100)
#  name                   :string(100)
#  language               :string
#  description            :text
#  active_from            :datetime
#  active_to              :datetime
#  is_admin               :boolean          default(FALSE)
#  created_by             :string(100)      not null
#  updated_by             :string(100)      not null
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
#  user_name              :string(30)       not null
#  code                   :string(10)       not null
#

class User < ApplicationRecord
  
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

  # validates :playground_id, presence: true
  # validates :default_playground_id, presence: true
  # validates :active_from, presence: true
  # validates :active_to, presence: true
  validates :last_name, presence: true, length: { maximum: 100 }
  validates :user_name, presence: true, uniqueness: true, length: { maximum: 30 }
  validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
  validates :external_directory_id, length: { maximum: 100 }
  validates :first_name, length: { maximum: 100 }
  validates :created_by, length: { maximum: 30 }
  validates :updated_by, length: { maximum: 30 }

# Relations
  has_many :group_users
  has_many :groups, through: :group_users
      
### private functions definitions
  private

  ### before filters
    def set_default_values
      self.playground_id = 1
      self.default_playground_id = 1
      self.current_playground_id = 1
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
