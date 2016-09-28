# == Schema Information
#
# Table name: skills
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_object_id :integer
#  skill_pattern      :string(100)
#  skill_size         :integer
#  skill_precision    :integer
#  skill_type_id      :integer
#  is_key             :boolean
#  is_published       :boolean
#

class Skill < ActiveRecord::Base

### scope
#  Skill is linked to a business object which belongs to the correct scope

### before filter : none

### validation
  validates :name, presence: true, length: {minimum: 2}
  validates :skill_type_id, presence: true
  validates :skill_size, presence: true
  belongs_to :skill_type, :class_name => "Parameter", :foreign_key => "skill_type_id"	# helps retrieving the status name
  belongs_to :business_object

  ### private functions definitions
  private
  
  def self.to_csv
    CSV.generate do |csv| #Could accept a separator option
      csv << column_names
      all.each do |column|
        csv << column.attributes.values_at(*column_names)
      end
    end
  end
end
