require 'rails_helper'

RSpec.describe "business_hierarchies/show", type: :view do
  before(:each) do
    @business_hierarchy = assign(:business_hierarchy, BusinessHierarchy.create!(
      :PCFindex => "Pc Findex",
      :hierarchy => "Hierarchy",
      :name => "Name",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Pc Findex/)
    expect(rendered).to match(/Hierarchy/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
