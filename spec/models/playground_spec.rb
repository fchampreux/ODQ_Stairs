# == Schema Information
#
# Table name: playgrounds
#
#  id            :integer          not null, primary key
#  playground_id :integer
#  code          :string(255)
#  name          :string(255)
#  description   :text
#  hierarchy     :string(255)
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

RSpec.describe Playground, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:playground)}
    it { should respond_to(:owner_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:playground)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:playground, name: nil)).to_not be_valid
  end
  
end
