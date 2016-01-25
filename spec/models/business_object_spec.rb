# == Schema Information
#
# Table name: business_objects
#
#  id                 :integer          not null, primary key
#  playground_id      :integer
#  code               :string(255)
#  name               :string(255)
#  description        :text
#  organisation_level :integer
#  territory_level    :integer
#  hierarchy          :string(255)
#  status_id          :integer
#  owner_id           :integer
#  db_technology      :string(255)
#  db_connection      :string(255)
#  db_owner_schema    :string(255)
#  structure_name     :string(255)
#  key_columns        :text
#  published_columns  :text
#  created_by         :string(255)
#  updated_by         :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  business_area_id   :integer
#  all_records        :integer
#  bad_records        :integer
#  score              :integer
#  odq_unique_id      :integer
#  odq_object_id      :integer
#

					

require 'rails_helper'

RSpec.describe BusinessObject, type: :model do
  
  describe 'Validations'
  subject {FactoryGirl.build(:business_object)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(2)}

###B.OBJECT2 to test that B. object mandatory fields are present in the model
  describe "Availability of mandatory fields" do
    it { should validate_presence_of(:playground_id) }
    it { should validate_presence_of(:owner_id) }
#    it { should validate_presence_of(:business_process_id) }
    it { should validate_presence_of(:status_id) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:hierarchy) }

  describe 'It can be created'
  it 'has a valid factory' do
    expect(build(:business_object)).to be_valid
  end
  it 'is invalid without a name' do
    expect(build(:business_object, name: nil)).to_not be_valid
  end
end
###B.OBJECT5 to test that fields are checked for unicity
#  describe "when business object is duplicated" do
#    before do
#      @business_object_duplicate = @business_object.dup
#      @business_object_duplicate.save!
#    end
#    it {should_not be_valid}
#  end


end
