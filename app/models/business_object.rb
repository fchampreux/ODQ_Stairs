class BusinessProcess < ActiveRecord::Base
	validates :code, presence: true, uniqueness: true
	validates :name, presence: true, uniqueness: true
	validates :hierarchy, presence: true, uniqueness: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	validates :business_process_id, presence: true	
	
	has_many :business_rules
	belongs_to :business_process
end
