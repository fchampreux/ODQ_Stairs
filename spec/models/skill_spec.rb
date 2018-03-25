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

require 'rails_helper'

RSpec.describe Skill, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:skill)}
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:business_object_id) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_presence_of(:playground_id) }
    it { should validate_presence_of(:business_object) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }
  it {should validate_presence_of(:skill_type_id)}
  it {should validate_presence_of(:skill_size)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:skill)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:skill, name: nil)).to_not be_valid
  end

end
