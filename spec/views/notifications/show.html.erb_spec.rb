require 'spec_helper'

describe "notifications/show" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification,
      :playground_id => 1,
      :name => "Name",
      :description => "MyText",
      :created_by => "Created By",
      :updated_by => "Updated By",
      :owner_id => 2,
      :severity_id => 3,
      :scope_id => 4,
      :business_object_id => 5,
      :odq_unique_id => 6,
      :odq_object_id => 7,
      :closed_at => "",
      :responsible_i => 8
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
    rendered.should match(/7/)
    rendered.should match(//)
    rendered.should match(/8/)
  end
end
