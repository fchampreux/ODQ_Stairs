# == Schema Information
#
# Table name: columns
#
#  id                 :integer          not null, primary key
#  name               :string(100)      not null
#  description        :text
#  type               :string(20)       not null
#  size               :integer          not null
#  is_key             :boolean          default(FALSE), not null
#  created_by         :string(100)      not null
#  updated_by         :string(100)      not null
#  session_id         :string(100)      not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_object_id :integer
#  playground_id      :integer
#

require 'rails_helper'

RSpec.describe Column, type: :model do
  
  describe 'Validations'
  subject {FactoryGirl.build(:column)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(2)}
  it {should validate_presence_of(:type)} 
  it {should validate_presence_of(:size)}
#  it {should validate_presence_of(:is_key)}
  it {should validate_presence_of(:created_by)}  
  it {should validate_presence_of(:updated_by)}
  it {should validate_presence_of(:session_id)}
  it {should validate_presence_of(:playground_id)}
  it {should validate_presence_of(:business_object_id)}
  it {should belong_to(:business_object)}

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:column)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:column, name: nil)).to_not be_valid
  end

end
