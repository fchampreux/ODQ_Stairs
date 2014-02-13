require 'spec_helper'

describe "lists_of_parameters/show" do
  before(:each) do
    @lists_of_parameter = assign(:lists_of_parameter, stub_model(ListsOfParameter))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
