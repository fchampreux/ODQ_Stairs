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
#  status_id               :integer
#  owner_id                :integer
#

class Scope < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :hierarchy, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	validates :organisation_level, presence: true

	belongs_to :business_object
end
