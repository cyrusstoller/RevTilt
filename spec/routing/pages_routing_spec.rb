require "spec_helper"

describe PagesController do
  describe "routing" do

    it "routes to about" do
      get("/about").should route_to("pages#about")
    end
    
    it "routes to favorites" do
      get("/favorites").should route_to("pages#favorites")
    end
    
    it "routes to press" do
      get("/press").should route_to("pages#press")
    end
    
  end
end
