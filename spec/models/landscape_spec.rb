# == Schema Information
#
# Table name: landscapes
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(200)      not null
#  description   :text
#  hierarchy     :string(25)       not null
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

RSpec.describe Landscape, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:landscape)}
    it { should validate_presence_of(:hierarchy) }
    it { should validate_uniqueness_of(:hierarchy).case_insensitive }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:playground_id) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code).scoped_to(:playground_id) }
    it { should validate_length_of(:code).is_at_most(60)}
    it { should validate_presence_of(:playground) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:landscape)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:landscape, name: nil)).to_not be_valid
  end
  
  
=begin
###B.PROCESS5 to test that fields are checked for unicity
  describe "when business process is duplicated" do
    before do
      @business_process_duplicate = @business_process.dup
      @business_process_duplicate.save!
    end
    it {should_not be_valid}
  end
=end

end
