require 'rails_helper'

RSpec.describe "BusinessHierarchies", type: :request do
  describe "GET /business_hierarchies" do
    it "works! (now write some real specs)" do
      get business_hierarchies_path
      expect(response).to have_http_status(200)
    end
  end
end
