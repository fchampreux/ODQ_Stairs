require 'rails_helper'

RSpec.describe "business_hierarchies/new", type: :view do
  before(:each) do
    assign(:business_hierarchy, BusinessHierarchy.new(
      :PCFindex => "MyString",
      :hierarchy => "MyString",
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders new business_hierarchy form" do
    render

    assert_select "form[action=?][method=?]", business_hierarchies_path, "post" do

      assert_select "input[name=?]", "business_hierarchy[PCFindex]"

      assert_select "input[name=?]", "business_hierarchy[hierarchy]"

      assert_select "input[name=?]", "business_hierarchy[name]"

      assert_select "textarea[name=?]", "business_hierarchy[description]"
    end
  end
end
