# == Schema Information
#
# Table name: parameters_lists
#
#  id            :integer          not null, primary key
#  playground_id :integer          not null
#  code          :string(60)       not null
#  name          :string(100)      not null
#  description   :text
#  owner_id      :integer          not null
#  created_by    :string(100)      not null
#  updated_by    :string(100)      not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe ParametersList, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:parameters_list)}
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


end
