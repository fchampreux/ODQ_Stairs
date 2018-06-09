# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  name               :string(100)      not null
#  description        :text
#  business_object_id :integer          not null
#  skill_size         :integer
#  skill_precision    :integer
#  skill_type_id      :integer
#  is_key             :boolean          default(FALSE)
#  is_published       :boolean          default(FALSE)
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class Skill < ActiveRecord::Base
extend CsvHelper

### scope
#  Skills are linked to a list which belongs to the correct scope

### before filter : none

### validation
	validates :name, presence: true, uniqueness: {scope: :business_object_id}, length: { minimum: 2, maximum: 100 }
  validates :skill_type_id, presence: true
  validates :skill_size, presence: true
  validates :playground_id, presence: true
  validates :business_object, presence: true
	validates :created_by , presence: true
	validates :updated_by, presence: true
	validates :owner_id, presence: true
  belongs_to :skill_type, :class_name => "Parameter", :foreign_key => "skill_type_id"	# helps retrieving the status name
  belongs_to :business_object

  ### private functions definitions
  private
=begin  
  def self.to_csv
    CSV.generate(:col_sep => ";") do |csv| #Could accept a separator option
      csv << column_names
      all.each do |column|
        csv << column.attributes.values_at(*column_names)
      end
    end
  end
=end  
end
