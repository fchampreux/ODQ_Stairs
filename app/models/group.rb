# == Schema Information
#
# Table name: groups
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :string
#  role            :string
#  territory_id    :integer
#  organisation_id :integer
#  created_by      :string
#  updated_by      :string
#  active_from     :date
#  active_to       :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  code            :string(10)
#

class Group < ApplicationRecord
  
#Relations
  has_many :group_users
  has_many :users, through: :group_users
end
