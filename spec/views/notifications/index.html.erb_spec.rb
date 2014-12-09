require 'spec_helper'

describe "notifications/index" do
  before(:each) do
    assign(:notifications, [
      stub_model(Notification,
        :playground_id => 1,
        :name => "Name",
        :description => "MyText",
        :created_by => "Created By",
        :updated_by => "Updated By",
        :owner_id => 2,
        :severity_id => 3,
        :scope_id => 4,
        :business_object_id => 5,
        :odq_unique_id => 6,
        :odq_object_id => 7,
        :closed_at => "",
        :responsible_i => 8
      ),
      stub_model(Notification,
        :playground_id => 1,
        :name => "Name",
        :description => "MyText",
        :created_by => "Created By",
        :updated_by => "Updated By",
        :owner_id => 2,
        :severity_id => 3,
        :scope_id => 4,
        :business_object_id => 5,
        :odq_unique_id => 6,
        :odq_object_id => 7,
        :closed_at => "",
        :responsible_i => 8
      )
    ])
  end

  it "renders a list of notifications" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
  end
end
