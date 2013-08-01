# == Schema Information
#
# Table name: scopes
#
#  id                      :integer          not null, primary key
#  playground_id           :integer
#  landscape_id            :integer
#  code                    :string(255)
#  name                    :string(255)
#  description             :text
#  SQL_query               :text
#  load_interface          :string(255)
#  organisation_level      :integer
#  territory_level         :integer
#  business_object_id      :integer
#  business_process_id     :integer
#  impacted_business_rules :text
#  hierarchy               :string(255)
#  created_by              :string(255)
#  updated_by              :string(255)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Scope < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :organisation_level, presence: true

	belongs_to :landscape
end
