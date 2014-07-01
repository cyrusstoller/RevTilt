require 'rails_helper'

describe PagesController, :type => :controller do
  render_views
  
  describe "GET 'about'" do
    it "returns http success" do
      get 'about'
      expect(response).to be_success
    end
  end
  
  describe "GET 'bookmarklet'" do
    it "returns http success" do
      get 'bookmarklet'
      expect(response).to be_success
    end
    
    describe "js" do
      it "should return the yelp bookmarklet" do
        get 'bookmarklet', :format => :js, :service => "Yelp"
        expect(response).to render_template("pages/bookmarklets/yelp_bookmarklet")
      end

      it "should set @new_window to false" do
        get 'bookmarklet', :format => :js, :service => "Yelp"
        expect(assigns(:new_window)).to eq(false)
      end
      
      it "should set @new_window to true" do
        get 'bookmarklet', :format => :js, :service => "Yelp", :new_window => "true"
        expect(assigns(:new_window)).to eq("true")
      end
      
      it "should render the error bookmarklet if the service is no good" do
        get 'bookmarklet', :format => :js
        expect(response).to render_template("pages/bookmarklets/error_bookmarklet")
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
      expect(response).to redirect_to(root_path)
    end
    
    it "should be successful" do
      @organization = FactoryGirl.create(:organization)
      @user.favorite!(@organization)
      get 'favorites'
      expect(response).to be_successful
    end
  end
  
  describe "GET 'press'" do
    it "returns http success" do
      get 'press'
      expect(response).to be_success
    end
  end

end
