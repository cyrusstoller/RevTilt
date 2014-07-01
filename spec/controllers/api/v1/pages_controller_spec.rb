require 'rails_helper'

describe Api::V1::PagesController, :type => :controller do
  render_views
  
  describe "GET 'documentation'" do
    it "returns http success" do
      get 'documentation'
      expect(response).to be_success
    end
  end

end
