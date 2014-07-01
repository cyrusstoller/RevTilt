require 'rails_helper'

describe PagesController do
  render_views
  
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      response.should be_success
    end
  end
  
  describe "GET 'bookmarklet'" do
    it "returns http success" do
      get 'bookmarklet'
      response.should be_success
    end
    
    describe "js" do
      it "should return the yelp bookmarklet" do
        get 'bookmarklet', :format => :js, :service => "Yelp"
        response.should render_template("pages/bookmarklets/yelp_bookmarklet")
      end

      it "should set @new_window to false" do
        get 'bookmarklet', :format => :js, :service => "Yelp"
        assigns(:new_window).should be_false
      end
      
      it "should set @new_window to true" do
        get 'bookmarklet', :format => :js, :service => "Yelp", :new_window => "true"
        assigns(:new_window).should be_true
      end
      
      it "should render the error bookmarklet if the service is no good" do
        get 'bookmarklet', :format => :js
        response.should render_template("pages/bookmarklets/error_bookmarklet")
      end
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
  
  describe "GET 'press'" do
    it "returns http success" do
      get 'press'
      response.should be_success
    end
  end

end
