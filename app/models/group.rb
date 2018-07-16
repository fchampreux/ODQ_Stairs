# == Schema Information
#
# Table name: groups
#
#  id              :bigint(8)        not null, primary key
#  code            :string(60)       not null
#  name            :string(100)      not null
#  description     :string
#  territory_id    :integer          not null
#  organisation_id :integer          not null
#  owner_id        :integer          not null
#  created_by      :string(100)      not null
#  updated_by      :string(100)      not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Group < ApplicationRecord
  
#Relations
  has_many :group_users
  has_many :users, through: :group_users
end
