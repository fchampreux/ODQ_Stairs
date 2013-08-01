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
#

class Playground < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true

	has_many :landscapes, dependent: :destroy
end
