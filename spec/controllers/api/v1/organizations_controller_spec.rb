require 'spec_helper'

describe Api::V1::OrganizationsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index', :format => :json
      response.should be_success
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
