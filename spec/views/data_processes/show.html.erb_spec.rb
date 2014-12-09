require 'spec_helper'

describe "data_processes/show" do
  before(:each) do
    @data_process = assign(:data_process, stub_model(DataProcess,
      :playground_id => 1,
      :name => "Name",
      :description => "MyText",
      :created_by => "Created By",
      :updated_by => "Updated By",
      :owner_id => 2,
      :scope_id => 3,
      :business_object_id => 4,
      :odq_unique_id => 5,
      :odq_object_id => 6,
      :next_run_at => "",
      :status_id => 7,
      :loaded => 8,
      :inserted => 9,
      :updated => 10,
      :deleted => 11,
      :rejected => 12,
      :duration => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Created By/)
    rendered.should match(/Updated By/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/4/)
    rendered.should match(/5/)
    rendered.should match(/6/)
    rendered.should match(//)
    rendered.should match(/7/)
    rendered.should match(/8/)
    rendered.should match(/9/)
    rendered.should match(/10/)
    rendered.should match(/11/)
    rendered.should match(/12/)
    rendered.should match(/9.99/)
  end
end
