# == Schema Information
#
# Table name: mappings
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  mappings_list_id :integer
#  source_software  :string(255)
#  source_table     :string(255)
#  source_value_id  :string(255)
#  source_code      :string(255)
#  target_software  :string(255)
#  target_table     :string(255)
#  target_value_id  :string(255)
#  target_code      :string(255)
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  source_caption   :string(255)
#  target_caption   :string(255)
#  owner_id         :integer
#


class Mapping < ActiveRecord::Base

### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validation
=begin
	validates :source_software  , presence: true, length: { maximum: 100 }
	validates :source_table     , presence: true, length: { maximum: 100 }
	validates :source_code      , presence: true, length: { maximum: 100 }
	validates :source_caption   , presence: true, length: { maximum: 100 }
	validates :target_software  , presence: true, length: { maximum: 100 }
	validates :target_table     , presence: true, length: { maximum: 100 }
	validates :target_code      , presence: true, length: { maximum: 100 }
	validates :target_caption   , presence: true, length: { maximum: 100 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
=end
	validates :playground_id, presence: true
        belongs_to :playground
	validates :playground, presence: true						# validates that the playground exists
        belongs_to :mappings_list
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name

### private functions definitions
  private


end


