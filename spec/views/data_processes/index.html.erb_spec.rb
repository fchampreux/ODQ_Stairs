require 'spec_helper'

describe "data_processes/index" do
  before(:each) do
    assign(:data_processes, [
      stub_model(DataProcess,
        :playground_id => 1,
        :name => "Name",
        :description => "MyText",
        :created_by => "Created By",
        :updated_by => "Updated By",
        :owner_id => 2,
        :scope_id => 3,
        :business_object_id => 4,
        :odq_unique_id => 5,
        :odq_object_id => 6,
        :next_run_at => "",
        :status_id => 7,
        :loaded => 8,
        :inserted => 9,
        :updated => 10,
        :deleted => 11,
        :rejected => 12,
        :duration => "9.99"
      ),
      stub_model(DataProcess,
        :playground_id => 1,
        :name => "Name",
        :description => "MyText",
        :created_by => "Created By",
        :updated_by => "Updated By",
        :owner_id => 2,
        :scope_id => 3,
        :business_object_id => 4,
        :odq_unique_id => 5,
        :odq_object_id => 6,
        :next_run_at => "",
        :status_id => 7,
        :loaded => 8,
        :inserted => 9,
        :updated => 10,
        :deleted => 11,
        :rejected => 12,
        :duration => "9.99"
      )
    ])
  end

  it "renders a list of data_processes" do
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
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
