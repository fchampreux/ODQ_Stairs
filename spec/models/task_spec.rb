# == Schema Information
#
# Table name: tasks
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  activity_id        :integer          not null
#  code               :string(60)       not null
#  name               :string(200)      not null
#  description        :text
#  hierarchy          :string(25)       not null
#  pcf_index          :string(30)
#  pcf_reference      :string(100)
#  software_id        :integer
#  external_reference :string(100)
#  status_id          :integer          not null
#  owner_id           :integer          not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:task)}
#   it { should validate_presence_of(:hierarchy) }
#   it { should validate_uniqueness_of(:hierarchy).case_insensitive }
#   it { should validate_presence_of(:playground_id) }
#   it { should validate_presence_of(:activity) }
    it { should validate_presence_of(:code) }
    it { should validate_length_of(:code).is_at_most(10)}
#    it { should validate_uniqueness_of(:code).scoped_to(:playground_id).case_insensitive }
    it { should validate_presence_of(:name) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_uniqueness_of(:name).scoped_to(:playground_id)}
		it { should validate_length_of(:pcf_index).is_at_most(30)}
		it { should validate_length_of(:pcf_reference).is_at_most(100)}
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:parameters_list)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:parameters_list, name: nil)).to_not be_valid
  end


end
