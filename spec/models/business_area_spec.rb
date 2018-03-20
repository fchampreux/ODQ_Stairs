# == Schema Information
#
# Table name: business_areas
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
#  pcf_index     :string(255)
#  pcf_reference :string(255)
#  status_id     :integer
#  owner_id      :integer
#  all_records   :integer
#  bad_records   :integer
#  score         :integer
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe BusinessArea, type: :model do
	
  describe 'Validations'
  subject {FactoryBot.build(:business_area)}
    it { should validate_presence_of(:playground_id) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
		it {should validate_length_of(:name).is_at_least(2)}
		
  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:business_area)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:business_area, name: nil)).to_not be_valid
  end

###B.AREA5 to test that fields are checked for unicity
#  describe "when business Area is duplicated" do
#    before do
#      @business_area_duplicate = @business_area.dup
#      @business_area_duplicate.save!
#    end
#    it {should_not be_valid}
#  end
end


