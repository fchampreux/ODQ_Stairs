# == Schema Information
#
# Table name: parameters_lists
#
#  id               :integer          not null, primary key
#  playground_id    :integer
#  code             :string(255)
#  name             :string(255)
#  description      :text
#  owner_id         :integer
#  is_user_specific :boolean
#  created_by       :string(255)
#  updated_by       :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe ParametersList, type: :model do
  
  describe 'Validations'
  subject {FactoryGirl.build(:parameters_list)}
    it { should respond_to(:owner_id) }
    it { should respond_to(:playground_id) }
    it { should respond_to(:name) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:parameters_list)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:parameters_list, name: nil)).to_not be_valid
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
