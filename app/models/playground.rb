# == Schema Information
#
# Table name: playgrounds
#
#  id          :integer          not null, primary key
#  code        :string(255)
#  name        :string(255)
#  description :text
#  hierarchy   :string(255)
#  created_by  :string(255)
#  updated_by  :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  status_id   :integer
#  owner_id    :integer
#

class Playground < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :hierarchy, presence: true, uniqueness: true, length: { maximum: 30 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name

	has_many :landscapes, dependent: :destroy
end
