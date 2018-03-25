# == Schema Information
#
# Table name: mappings
#
#  id               :integer          not null, primary key
#  playground_id    :integer          not null
#  mappings_list_id :integer          not null
#  source_software  :string(100)
#  source_table     :string(100)
#  source_value_id  :string(100)
#  source_code      :string(100)
#  target_software  :string(100)
#  target_table     :string(100)
#  target_value_id  :string(100)
#  target_code      :string(100)
#  source_property  :string(100)
#  target_property  :string(100)
#  owner_id         :integer          not null
#  created_by       :string(100)      not null
#  updated_by       :string(100)      not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'rails_helper'

RSpec.describe Mapping, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:mapping)}
    it { should respond_to(:owner_id) }
    it { should respond_to(:playground_id) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:mapping)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:mapping, source_table: nil)).to_not be_valid
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
