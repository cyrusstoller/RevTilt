require 'spec_helper'

describe Api::V1::OrganizationsController do
  render_views
  
  describe "GET 'index'" do
    before(:each) do
      @organization = FactoryGirl.create(:organization)
    end
    
    it "returns http success" do
      get 'index', :format => :json
      response.should be_success
    end
    
    it "should return 500 if only latitude, longitude and no radius" do
      get 'index', :latitude => @organization.latitude, :longitude => @organization.longitude, :format => :json
      response.should_not be_success
      response.status.should == 500
    end
    
    it "should be successful if given all of latitude, longitude, and radius" do
      get 'index', :latitude => @organization.latitude, :longitude => @organization.longitude, :radius => 20, :format => :json
      response.should be_success
      assigns(:organizations).should include(@organization)
    end
  end
  
  describe "GET 'index'" do
    it "returns http success" do
      organization = FactoryGirl.create(:organization)
      get 'show', :id => organization.to_param, :format => :json
      response.should be_success
    end
  end

end
