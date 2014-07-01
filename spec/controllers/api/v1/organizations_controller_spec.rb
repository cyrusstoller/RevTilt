require 'rails_helper'

describe Api::V1::OrganizationsController, :type => :controller do
  render_views
  
  describe "GET 'index'" do
    before(:each) do
      @organization = FactoryGirl.create(:organization)
    end
    
    it "returns http success" do
      get 'index', :format => :json
      expect(response).to be_success
    end
    
    it "should return 500 if only latitude, longitude and no radius" do
      get 'index', :latitude => @organization.latitude, :longitude => @organization.longitude, :format => :json
      expect(response).not_to be_success
      expect(response.status).to eq(500)
    end
    
    it "should be successful if given all of latitude, longitude, and radius" do
      get 'index', :latitude => @organization.latitude, :longitude => @organization.longitude, :radius => 20, :format => :json
      expect(response).to be_success
      expect(assigns(:organizations)).to include(@organization)
    end
  end
  
  describe "GET 'show'" do
    it "returns http success" do
      organization = FactoryGirl.create(:organization)
      get 'show', :id => organization.to_param, :format => :json
      expect(response).to be_success
    end
  end

end
