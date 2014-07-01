require "rails_helper"

describe PagesController, :type => :routing do
  describe "routing" do

    it "routes to about" do
      expect(get("/about")).to route_to("pages#about")
    end
    
    it "routes to bookmarklet" do
      expect(get("/bookmarklet")).to route_to("pages#bookmarklet")
    end
    
    it "routes to favorites" do
      expect(get("/favorites")).to route_to("pages#favorites")
    end
    
    it "routes to press" do
      expect(get("/press")).to route_to("pages#press")
    end
    
  end
end
