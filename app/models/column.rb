# == Schema Information
#
# Table name: columns
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  size               :integer          not null
#  is_key             :boolean          default(FALSE), not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  session_id         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_object_id :integer
#  playground_id      :integer
#  is_published       :boolean
#  precision          :integer
#  column_type        :string(20)
#

class Column < ActiveRecord::Base
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

### before filter

### validation
  validates :name, presence: true, length: {minimum: 2}
  validates :business_object_id, presence: true
  validates :playground_id, presence: true
  validates :column_type, presence: true
  validates :size, presence: true
#  validates :is_key, presence: true
  validates :created_by, presence: true
  validates :updated_by, presence: true
  validates :session_id, presence: true
  belongs_to :playground
  belongs_to :business_object
end
