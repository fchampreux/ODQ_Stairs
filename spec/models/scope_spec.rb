# == Schema Information
#
# Table name: scopes
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  landscape_id       :integer
#  code               :string(255)
#  name               :string(255)
#  load_interface     :string(255)
#  organisation_level :integer
#  territory_level    :integer
#  business_object_id :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  all_records        :integer
#  bad_records        :integer
#  score              :integer
#  db_technology      :string(30)
#  db_connection      :string(200)
#  db_owner_schema    :string(30)
#  structure_name     :string(50)
#  description        :text
#  sql_query          :text
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe Scope, type: :model do
  
  describe 'Validations'
  subject {FactoryBot.build(:scope)}
    it { should respond_to(:playground_id) }
    it { should respond_to(:owner_id) }
    it { should respond_to(:landscape_id) }
    it { should respond_to(:status_id) }
    it { should respond_to(:name) }
    it { should respond_to(:code) }
    it { should respond_to(:hierarchy) }


  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:scope)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:scope, name: nil)).to_not be_valid
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
