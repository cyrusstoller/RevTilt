require "spec_helper"

describe Relationships::OrganizationUsersController do
  describe "routing" do

    it "routes to #index" do
      get("/relationships/organization_users").should route_to("relationships/organization_users#index")
    end

    it "routes to #new" do
      get("/relationships/organization_users/new").should route_to("relationships/organization_users#new")
    end

    it "routes to #show" do
      get("/relationships/organization_users/1").should route_to("relationships/organization_users#show", :id => "1")
    end

    it "routes to #edit" do
      get("/relationships/organization_users/1/edit").should route_to("relationships/organization_users#edit", :id => "1")
    end

    it "routes to #create" do
      post("/relationships/organization_users").should route_to("relationships/organization_users#create")
    end

    it "routes to #update" do
      put("/relationships/organization_users/1").should route_to("relationships/organization_users#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/relationships/organization_users/1").should route_to("relationships/organization_users#destroy", :id => "1")
    end
    
    it "routes to #favorite" do
      post("/relationships/organization_users/favorite").should route_to("relationships/organization_users#favorite")
    end

    it "routes to #unfavorite" do
      delete("/relationships/organization_users/unfavorite").should route_to("relationships/organization_users#unfavorite")
    end
  end
end
