# == Schema Information
#
# Table name: audit_trails
#
#  id             :integer          not null, primary key
#  playground_id  :integer          not null
#  task_id        :integer          not null
#  action         :string           not null
#  object_id      :integer          not null
#  object_class   :string(100)
#  object_name    :string(100)
#  breach_type_id :integer          default(0)
#  server_name    :string(100)
#  description    :string(1000)
#  created_at     :datetime         not null
#  created_by     :string(100)
#

class AuditTrail < ApplicationRecord
#Filters

#Record validations

### validations
	validates :playground, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the requestor name
	belongs_to :breach_type, :class_name => "Parameter", :foreign_key => "breach_type_id"	# helps retrieving the type name

#Record relations
  belongs_to :task
  belongs_to :object
  belongs_to :playground
  
end
