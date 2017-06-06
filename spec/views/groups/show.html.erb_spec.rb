require 'rails_helper'

RSpec.describe "groups/show", type: :view do
  before(:each) do
    @group = assign(:group, Group.create!(
      :name => "Name",
      : => "",
      :description => "Description",
      : => "",
      :role => "Role",
      : => "",
      :territory_id => "Territory",
      : => 2,
      :organisation_id => "Organisation",
      : => 3,
      :created_by => "Created By",
      : => "",
      :updated_by => "Updated By",
      : => "",
      :active_from => "Active From",
      :active_to => "Active To"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Role/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Territory/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Organisation/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Created By/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Updated By/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Active From/)
    expect(rendered).to match(/Active To/)
  end
end
