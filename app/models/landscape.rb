# == Schema Information
#
# Table name: landscapes
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Landscape < ActiveRecord::Base
	validates :playground_id, presence: true
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true

	has_many :scopes, dependent: :destroy
	belongs_to :playground
end
