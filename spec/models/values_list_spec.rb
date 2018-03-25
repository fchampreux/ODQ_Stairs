# == Schema Information
#
# Table name: values_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  table_name    :string(100)
#  software_id   :integer
#  software_name :string(100)
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
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
