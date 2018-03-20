# == Schema Information
#
# Table name: values_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  owner_id      :integer
#  table_name    :string(255)
#  software_id   :integer
#  software_name :string(255)
#  created_by    :string(255)
#  updated_by    :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe ValuesList, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:values_list)}
    it { should respond_to(:name) }
    it { should respond_to(:playground_id) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:values_list)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:values_list, name: nil)).to_not be_valid
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
