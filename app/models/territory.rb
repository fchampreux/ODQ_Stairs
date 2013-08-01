# == Schema Information
#
# Table name: territories
#
#  id                  :integer          not null, primary key
#  playground_id       :integer
#  code                :string(255)
#  name                :string(255)
#  description         :text
#  parent_territory_id :integer
#  territory_level     :integer
#  hierarchy           :string(255)
#  created_by          :string(255)
#  updated_by          :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Territory < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :territory_level, presence: true
end
