require 'spec_helper'

describe PagesController do
  render_views
  
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end
  
  describe "GET 'favorites'" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end
    
    it "should redirect to root_path" do
      get 'favorites'
      response.should redirect_to(root_path)
    end
    
    it "should be successful" do
      @organization = FactoryGirl.create(:organization)
      @user.favorite!(@organization)
      get 'favorites'
      response.should be_successful
    end
  end

end
