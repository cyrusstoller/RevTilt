require "rails_helper"

describe Api::V1::OrganizationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get("/api/v1/organizations")).to route_to("api/v1/organizations#index")
    end
    
    it "routes to #show" do
      expect(get("/api/v1/organizations/1")).to route_to("api/v1/organizations#show", :id => "1")
    end

  end
end
