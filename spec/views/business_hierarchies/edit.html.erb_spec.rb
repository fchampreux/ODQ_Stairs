require 'rails_helper'

RSpec.describe "business_hierarchies/edit", type: :view do
  before(:each) do
    @business_hierarchy = assign(:business_hierarchy, BusinessHierarchy.create!(
      :PCFindex => "MyString",
      :hierarchy => "MyString",
      :name => "MyString",
      :description => "MyText"
    ))
  end

  it "renders the edit business_hierarchy form" do
    render

    assert_select "form[action=?][method=?]", business_hierarchy_path(@business_hierarchy), "post" do

      assert_select "input[name=?]", "business_hierarchy[PCFindex]"

      assert_select "input[name=?]", "business_hierarchy[hierarchy]"

      assert_select "input[name=?]", "business_hierarchy[name]"

      assert_select "textarea[name=?]", "business_hierarchy[description]"
    end
  end
end
