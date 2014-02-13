require 'spec_helper'

describe "lists_of_parameters/new" do
  before(:each) do
    assign(:lists_of_parameter, stub_model(ListsOfParameter).as_new_record)
  end

  it "renders new lists_of_parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lists_of_parameters_path, "post" do
    end
  end
end
