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

require 'rails_helper'

RSpec.describe Playground, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:playground)}
    it { should validate_presence_of(:hierarchy) }
    it { should validate_uniqueness_of(:hierarchy).case_insensitive }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code)}
    it { should validate_length_of(:code).is_at_most(60)}
    it { should validate_presence_of(:playground_id) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:playground)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:playground, name: nil)).to_not be_valid
  end
  
end
