require 'spec_helper'

describe "requests/index" do
  before(:each) do
    assign(:requests, [
      stub_model(Request,
        :type => "Type",
        : => "",
        :who => "Who",
        : => "",
        :when => "When",
        :observation => "Observation",
        : => "MyText"
      ),
      stub_model(Request,
        :type => "Type",
        : => "",
        :who => "Who",
        : => "",
        :when => "When",
        :observation => "Observation",
        : => "MyText"
      )
    ])
  end

  it "renders a list of requests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Who".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "When".to_s, :count => 2
    assert_select "tr>td", :text => "Observation".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
