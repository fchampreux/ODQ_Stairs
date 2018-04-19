# == Schema Information
#
# Table name: playgrounds
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  hierarchy     :string(25)
#  status_id     :integer          not null
#  all_records   :integer          default(0)
#  bad_records   :integer          default(0)
#  score         :integer          default(0)
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Playground < ActiveRecord::Base
extend SimpleSearch
extend CsvHelper

### before filter
  before_create :set_hierarchy

	validates :hierarchy, presence: true, uniqueness: true, case_sensitive: false, length: { maximum: 30 }
	validates :code, presence: true, uniqueness: true, length: { maximum: 10 }
	validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 100 }
	validates :description, length: { maximum: 1000 }
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
	validates :status_id, presence: true
	validates :playground_id, presence: true
	belongs_to :owner, :class_name => "User", :foreign_key => "owner_id"		# helps retrieving the owner name
	belongs_to :status, :class_name => "Parameter", :foreign_key => "status_id"	# helps retrieving the status name
	has_many :landscapes

### private functions definitions
  private

  ### before filters
    def set_hierarchy
=begin
      if Playground.count == 0 or Playground.count == 1
        self.hierarchy =  Playground.count
      else 
        last_one = Playground.maximum("hierarchy")
        self.hierarchy = last_one.next
      end
=end
      case Playground.count
			when 0
        self.hierarchy =  0
      when 1
        self.hierarchy =  1				
      else 
        last_one = Playground.maximum("hierarchy")
        self.hierarchy = last_one.next
      end

    end

end
