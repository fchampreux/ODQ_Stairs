# == Schema Information
#
# Table name: values
#
#  id             :integer          not null, primary key
#  playground_id  :integer          not null
#  values_list_id :integer          not null
#  code           :string(60)       not null
#  name           :string(100)      not null
#  description    :text
#  property       :string(100)
#  created_by     :string(100)      not null
#  updated_by     :string(100)      not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'rails_helper'

RSpec.describe Value, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:value)}
    it { should respond_to(:name) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
    it { should validate_uniqueness_of(:name).scoped_to(:values_list_id).case_insensitive }  
    it { should respond_to(:code) }
    it { should validate_length_of(:code).is_at_most(20)}
    it { should validate_uniqueness_of(:code).scoped_to(:values_list_id).case_insensitive } 
    it { should validate_presence_of(:playground_id) }
    it { should validate_presence_of(:values_list) }
    it { should validate_presence_of(:created_by) }
    it { should validate_presence_of(:updated_by) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:value)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:value, name: nil)).to_not be_valid
  end
=begin
###PARAM5 to test that fields are checked for unicity
  describe "when parameter is duplicated" do
    before do
      @parameter_duplicate = @parameter.dup
      @parameter_duplicate.save!
    end
    it {should_not be_valid}
  end
=end

end
