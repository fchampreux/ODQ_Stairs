# == Schema Information
#
# Table name: business_processes
#
#  id               :integer          not null, primary key
#  playground_id    :integer          not null
#  business_flow_id :integer          not null
#  code             :string(60)       not null
#  name             :string(100)      not null
#  description      :text
#  hierarchy        :string(25)       not null
#  pcf_index        :string(30)
#  pcf_reference    :string(100)
#  status_id        :integer          not null
#  owner_id         :integer          not null
#  all_records      :integer          default(0)
#  bad_records      :integer          default(0)
#  score            :integer          default(0)
#  created_by       :string(100)      not null
#  updated_by       :string(100)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe BusinessProcess, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:business_process)}
    it { should validate_presence_of(:hierarchy) }
    it { should validate_uniqueness_of(:hierarchy).case_insensitive }
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name).scoped_to(:playground_id) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_presence_of(:code) }
    it { should validate_uniqueness_of(:code).scoped_to(:business_flow_id) }
    it { should validate_length_of(:code).is_at_most(60)}
		it { should validate_length_of(:pcf_index).is_at_most(30)}
		it { should validate_length_of(:pcf_reference).is_at_most(100)}
    it { should validate_presence_of(:playground_id) }
    it { should validate_presence_of(:business_flow) }
    it { should validate_presence_of(:owner_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:business_object)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:business_object, name: nil)).to_not be_valid
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
