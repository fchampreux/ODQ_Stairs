# == Schema Information
#
# Table name: parameters
#
#  id                 :integer          not null, primary key
#  playground_id      :integer          not null
#  parameters_list_id :integer          not null
#  name               :string(100)      not null
#  description        :text
#  active_from        :datetime         not null
#  active_to          :datetime         not null
#  parent_list        :string(100)
#  code               :string(20)       not null
#  property           :string(30)       not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Parameter, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:parameter)}
    it { should respond_to(:name) }
		it { should validate_length_of(:name).is_at_least(2).is_at_most(100)}
#    it { should validate_uniqueness_of(:name).scoped_to(:playground_id).case_insensitive }  
    it { should respond_to(:code) }
    it { should validate_length_of(:code).is_at_most(20)}
#    it { should validate_uniqueness_of(:code).scoped_to(:playground_id).case_insensitive }  
    it { should respond_to(:property) }
    it { should validate_length_of(:property).is_at_most(30)}
#    it { should validate_presence_of(:playground_id) }
#    it { should validate_presence_of(:parameters_list) }
    it { should respond_to(:active_from) }
    it { should respond_to(:active_to) }
    it { should validate_presence_of(:created_by) }
#   it { should validate_presence_of(:updated_by) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:parameter)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:parameter, name: nil)).to_not be_valid
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
