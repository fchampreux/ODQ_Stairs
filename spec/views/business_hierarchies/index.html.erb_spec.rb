require 'rails_helper'

RSpec.describe "business_hierarchies/index", type: :view do
  before(:each) do
    assign(:business_hierarchies, [
      BusinessHierarchy.create!(
        :PCFindex => "Pc Findex",
        :hierarchy => "Hierarchy",
        :name => "Name",
        :description => "MyText"
      ),
      BusinessHierarchy.create!(
        :PCFindex => "Pc Findex",
        :hierarchy => "Hierarchy",
        :name => "Name",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of business_hierarchies" do
    render
    assert_select "tr>td", :text => "Pc Findex".to_s, :count => 2
    assert_select "tr>td", :text => "Hierarchy".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
