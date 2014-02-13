require 'spec_helper'

describe "lists_of_parameters/edit" do
  before(:each) do
    @lists_of_parameter = assign(:lists_of_parameter, stub_model(ListsOfParameter))
  end

  it "renders the edit lists_of_parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", lists_of_parameter_path(@lists_of_parameter), "post" do
    end
  end
end
