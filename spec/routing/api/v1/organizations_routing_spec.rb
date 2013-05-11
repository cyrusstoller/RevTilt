require "spec_helper"

describe Api::V1::OrganizationsController do
  describe "routing" do

    it "routes to #index" do
      get("/api/v1/organizations").should route_to("api/v1/organizations#index")
    end
    
    it "routes to #show" do
      get("/api/v1/organizations/1").should route_to("api/v1/organizations#show", :id => "1")
    end

  end
end
