require 'spec_helper'

describe "requests/show" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :type => "Type",
      : => "",
      :who => "Who",
      : => "",
      :when => "When",
      :observation => "Observation",
      : => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Type/)
    rendered.should match(//)
    rendered.should match(/Who/)
    rendered.should match(//)
    rendered.should match(/When/)
    rendered.should match(/Observation/)
    rendered.should match(/MyText/)
  end
end
