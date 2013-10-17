require 'spec_helper'

describe "parameters/edit" do
  before(:each) do
    @parameter = assign(:parameter, stub_model(Parameter,
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
    ))
  end

  it "renders the edit parameter form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", parameter_path(@parameter), "post" do
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
