# == Schema Information
#
# Table name: organisations
#
#  id                     :integer          not null, primary key
#  playground_id          :integer
#  code                   :string(255)
#  name                   :string(255)
#  description            :text
#  parent_organisation_id :integer
#  organisation_level     :integer
#  hierarchy              :string(255)
#  created_by             :string(255)
#  updated_by             :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Organisation < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :organisation_level, presence: true
end
