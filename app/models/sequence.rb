# == Schema Information
#
# Table name: sequences
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  class_name    :string(255)
#  current_id    :integer
#

class Sequence < ActiveRecord::Base
  
  ### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }

end
