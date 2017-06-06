require 'rails_helper'

RSpec.describe "groups/new", type: :view do
  before(:each) do
    assign(:group, Group.new(
      :name => "MyString",
      : => "MyString",
      :description => "MyString",
      : => "MyString",
      :role => "MyString",
      : => "MyString",
      :territory_id => "MyString",
      : => 1,
      :organisation_id => "MyString",
      : => 1,
      :created_by => "MyString",
      : => "MyString",
      :updated_by => "MyString",
      : => "MyString",
      :active_from => "MyString",
      :active_to => "MyString"
    ))
  end

  it "renders new group form" do
    render

    assert_select "form[action=?][method=?]", groups_path, "post" do

      assert_select "input[name=?]", "group[name]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[description]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[role]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[territory_id]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[organisation_id]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[created_by]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[updated_by]"

      assert_select "input[name=?]", "group[]"

      assert_select "input[name=?]", "group[active_from]"

      assert_select "input[name=?]", "group[active_to]"
    end
  end
end
