# == Schema Information
#
# Table name: business_objects
#
#  id                  :integer          not null, primary key
#  playground_id       :integer
#  business_process_id :string(255)
#  code                :string(255)
#  name                :string(255)
#  description         :text
#  organisation_level  :integer
#  territory_level     :integer
#  hierarchy           :string(255)
#  PCF_index           :string(255)
#  PCF_reference       :string(255)
#  status_id           :integer
#  owner_id            :integer
#  db_technology       :string(255)
#  db_connection       :string(255)
#  db_owner_schema     :string(255)
#  structure_name      :string(255)
#  key_columns         :text
#  published_columns   :text
#  created_by          :string(255)
#  updated_by          :string(255)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class BusinessObject < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :hierarchy, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :business_process_id, presence: true
	validates :PCF_index, length: { maximum: 30 }
	validates :PCF_reference, length: { maximum: 30 }
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	belongs_to :business_area
	has_many :business_rules
end
