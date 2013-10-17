require 'spec_helper'

describe "parameters/index" do
  before(:each) do
    assign(:parameters, [
      stub_model(Parameter,
        :playground_id => 1,
        :is_list => false,
        :parent_list_id => 2,
        :code => "Code",
        :name => "Name",
        :description => "MyText",
        :parameter_index => 3,
        :parameter_caption => "Parameter Caption",
        :created_by => "Created By",
        :updated_by => "Updated By"
      ),
      stub_model(Parameter,
        :playground_id => 1,
        :is_list => false,
        :parent_list_id => 2,
        :code => "Code",
        :name => "Name",
        :description => "MyText",
        :parameter_index => 3,
        :parameter_caption => "Parameter Caption",
        :created_by => "Created By",
        :updated_by => "Updated By"
      )
    ])
  end

  it "renders a list of parameters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Parameter Caption".to_s, :count => 2
    assert_select "tr>td", :text => "Created By".to_s, :count => 2
    assert_select "tr>td", :text => "Updated By".to_s, :count => 2
  end
end
