require 'spec_helper'

describe "parameters/show" do
  before(:each) do
    @parameter = assign(:parameter, stub_model(Parameter,
      :playground_id => 1,
      :is_list => false,
      :parent_list_id => 2,
      :code => "Code",
      :name => "Name",
      :description => "MyText",
      :parameter_index => 3,
      :parameter_caption => "Parameter Caption",
      :created_by => "Created By",
      :updated_by => "Updated By"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
    rendered.should match(/Code/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/3/)
    rendered.should match(/Parameter Caption/)
    rendered.should match(/Created By/)
    rendered.should match(/Updated By/)
  end
end
