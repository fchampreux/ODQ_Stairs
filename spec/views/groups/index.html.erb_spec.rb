require 'rails_helper'

RSpec.describe "groups/index", type: :view do
  before(:each) do
    assign(:groups, [
      Group.create!(
        :name => "Name",
        : => "",
        :description => "Description",
        : => "",
        :role => "Role",
        : => "",
        :territory_id => "Territory",
        : => 2,
        :organisation_id => "Organisation",
        : => 3,
        :created_by => "Created By",
        : => "",
        :updated_by => "Updated By",
        : => "",
        :active_from => "Active From",
        :active_to => "Active To"
      ),
      Group.create!(
        :name => "Name",
        : => "",
        :description => "Description",
        : => "",
        :role => "Role",
        : => "",
        :territory_id => "Territory",
        : => 2,
        :organisation_id => "Organisation",
        : => 3,
        :created_by => "Created By",
        : => "",
        :updated_by => "Updated By",
        : => "",
        :active_from => "Active From",
        :active_to => "Active To"
      )
    ])
  end

  it "renders a list of groups" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Role".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Territory".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Organisation".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Active From".to_s, :count => 2
    assert_select "tr>td", :text => "Active To".to_s, :count => 2
  end
end
