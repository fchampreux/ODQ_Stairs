require 'spec_helper'

describe "requests/edit" do
  before(:each) do
    @request = assign(:request, stub_model(Request,
      :type => "",
      : => "MyString",
      :who => "MyString",
      : => "MyString",
      :when => "MyString",
      :observation => "MyString",
      : => "MyText"
    ))
  end

  it "renders the edit request form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", request_path(@request), "post" do
      assert_select "input#request_type[name=?]", "request[type]"
      assert_select "input#request_[name=?]", "request[]"
      assert_select "input#request_who[name=?]", "request[who]"
      assert_select "input#request_[name=?]", "request[]"
      assert_select "input#request_when[name=?]", "request[when]"
      assert_select "input#request_observation[name=?]", "request[observation]"
      assert_select "textarea#request_[name=?]", "request[]"
    end
  end
end
