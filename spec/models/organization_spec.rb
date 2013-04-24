# == Schema Information
# Schema version: 20130424221615
#
# Table name: organizations
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  url              :string(255)
#  url_type         :string(255)
#  latitude         :float
#  longitude        :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#  address          :string(255)
#  display_location :string(255)
#

require 'spec_helper'

describe Organization do
  describe "validation" do
    it "should be valid" do
      FactoryGirl.build(:organization).should be_valid
    end
    
    it "should not be valid without a category_id" do
      FactoryGirl.build(:organization, :category_id => nil).should_not be_valid
    end
    
    it "should not be valid without a name" do
      FactoryGirl.build(:organization, :name => nil).should_not be_valid
    end
    
    it "should not be valid without a url" do
      FactoryGirl.build(:organization, :url => nil).should_not be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond to organization_user_relationships" do
      FactoryGirl.build(:organization).should respond_to(:organization_user_relationships)
    end
    
    it "should respond to reviews" do
      FactoryGirl.build(:organization).should respond_to(:reviews)
    end
    
    it "should respond to users" do
      FactoryGirl.build(:organization).should respond_to(:users)
    end
  end
  
  describe "geocoder" do
    it "should set the lat/lon" do
      organization = FactoryGirl.create(:organization, :address => "19081")
      organization.latitude.should == 40.7143528
      organization.longitude.should == -74.0059731
    end
  end
end
