require "rails_helper"

describe Relationships::OrganizationUsersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get("/relationships/organization_users")).to route_to("relationships/organization_users#index")
    end

    it "routes to #new" do
      expect(get("/relationships/organization_users/new")).to route_to("relationships/organization_users#new")
    end

    it "routes to #show" do
      expect(get("/relationships/organization_users/1")).to route_to("relationships/organization_users#show", :id => "1")
    end

    it "routes to #edit" do
      expect(get("/relationships/organization_users/1/edit")).to route_to("relationships/organization_users#edit", :id => "1")
    end

    it "routes to #create" do
      expect(post("/relationships/organization_users")).to route_to("relationships/organization_users#create")
    end

    it "routes to #update" do
      expect(put("/relationships/organization_users/1")).to route_to("relationships/organization_users#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(delete("/relationships/organization_users/1")).to route_to("relationships/organization_users#destroy", :id => "1")
    end
    
    it "routes to #favorite" do
      expect(post("/relationships/organization_users/favorite")).to route_to("relationships/organization_users#favorite")
    end

    it "routes to #unfavorite" do
      expect(delete("/relationships/organization_users/unfavorite")).to route_to("relationships/organization_users#unfavorite")
    end
  end
end
