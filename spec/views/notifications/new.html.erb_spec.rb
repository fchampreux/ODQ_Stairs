require 'spec_helper'

describe "notifications/new" do
  before(:each) do
    assign(:notification, stub_model(Notification,
      :playground_id => 1,
      :name => "MyString",
      :description => "MyText",
      :created_by => "MyString",
      :updated_by => "MyString",
      :owner_id => 1,
      :severity_id => 1,
      :scope_id => 1,
      :business_object_id => 1,
      :odq_unique_id => 1,
      :odq_object_id => 1,
      :closed_at => "",
      :responsible_i => 1
    ).as_new_record)
  end

  it "renders new notification form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", notifications_path, "post" do
      assert_select "input#notification_playground_id[name=?]", "notification[playground_id]"
      assert_select "input#notification_name[name=?]", "notification[name]"
      assert_select "textarea#notification_description[name=?]", "notification[description]"
      assert_select "input#notification_created_by[name=?]", "notification[created_by]"
      assert_select "input#notification_updated_by[name=?]", "notification[updated_by]"
      assert_select "input#notification_owner_id[name=?]", "notification[owner_id]"
      assert_select "input#notification_severity_id[name=?]", "notification[severity_id]"
      assert_select "input#notification_scope_id[name=?]", "notification[scope_id]"
      assert_select "input#notification_business_object_id[name=?]", "notification[business_object_id]"
      assert_select "input#notification_odq_unique_id[name=?]", "notification[odq_unique_id]"
      assert_select "input#notification_odq_object_id[name=?]", "notification[odq_object_id]"
      assert_select "input#notification_closed_at[name=?]", "notification[closed_at]"
      assert_select "input#notification_responsible_i[name=?]", "notification[responsible_i]"
    end
  end
end
