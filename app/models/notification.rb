# == Schema Information
#
# Table name: notifications
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  name               :string(255)
#  description        :text
#  severity_id        :integer
#  status_id          :integer
#  scope_id           :integer
#  business_object_id :integer
#  expected_at        :datetime
#  closed_at          :datetime
#  responsible_id     :integer
#  owner_id           :integer
#  created_by         :string(255)
#  updated_by         :string(255)
#  odq_unique_id      :integer
#  odq_object_id      :integer
#  created_at         :datetime
#  updated_at         :datetime
#

class Notification < ActiveRecord::Base
  
self.sequence_name = "global_seq"  
  
### scope
  scope :pgnd, ->(my_pgnd) { where "playground_id=?", my_pgnd }
  
  ### validations
	validates :name, presence: true, length: { maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"			# helps retrieving the requestor name
	belongs_to :responsible, :class_name => "User", :foreign_key => "responsible_id"	# helps retrieving the responible name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"		# helps retrieving the status name
	belongs_to :severity, :class_name => "Parameter", :foreign_key => "severity_id"		# helps retrieving the severity grade
	belongs_to :scope	                                                                # helps retrieving the scope name
	belongs_to :business_object	                                                        # helps retrieving the business object name
	has_many :breaches
	acts_as_sequenced scope: :playground_id, column: :odq_object_id				#
end


