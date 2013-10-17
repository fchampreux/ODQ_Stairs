require 'spec_helper'

describe "parameters/new" do
  before(:each) do
    assign(:parameter, stub_model(Parameter,
      :playground_id => 1,
      :is_list => false,
      :parent_list_id => 1,
      :code => "MyString",
      :name => "MyString",
      :description => "MyText",
      :parameter_index => 1,
      :parameter_caption => "MyString",
      :created_by => "MyString",
      :updated_by => "MyString"
    ).as_new_record)
  end

  it "renders new parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parameters_path, "post" do
      assert_select "input#parameter_playground_id[name=?]", "parameter[playground_id]"
      assert_select "input#parameter_is_list[name=?]", "parameter[is_list]"
      assert_select "input#parameter_parent_list_id[name=?]", "parameter[parent_list_id]"
      assert_select "input#parameter_code[name=?]", "parameter[code]"
      assert_select "input#parameter_name[name=?]", "parameter[name]"
      assert_select "textarea#parameter_description[name=?]", "parameter[description]"
      assert_select "input#parameter_parameter_index[name=?]", "parameter[parameter_index]"
      assert_select "input#parameter_parameter_caption[name=?]", "parameter[parameter_caption]"
      assert_select "input#parameter_created_by[name=?]", "parameter[created_by]"
      assert_select "input#parameter_updated_by[name=?]", "parameter[updated_by]"
    end
  end
end
