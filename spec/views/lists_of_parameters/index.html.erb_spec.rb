require 'spec_helper'

describe "lists_of_parameters/index" do
  before(:each) do
    assign(:lists_of_parameters, [
      stub_model(ListsOfParameter),
      stub_model(ListsOfParameter)
    ])
  end

  it "renders a list of lists_of_parameters" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
