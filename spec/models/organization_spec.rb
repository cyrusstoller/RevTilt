# == Schema Information
# Schema version: 20130501180835
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
#  homepage_url     :string(255)
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
    
    it "should not be valid with the smae url" do
      organization = FactoryGirl.create(:organization)
      FactoryGirl.build(:organization, :url => organization.url).should_not be_valid
    end
    
    it "should be valid with a homepage_url" do
      FactoryGirl.build(:organization, :homepage_url => "http://www.google.com").should be_valid
    end
    
    it "should be valid without a homepage_url" do
      FactoryGirl.build(:organization, :homepage_url => nil).should be_valid
    end
    
    it "should be valid with a homepage_url sans http" do
      organization = FactoryGirl.build(:organization, :homepage_url => "www.google.com")
      organization.should be_valid
      organization.homepage_url.should == "http://www.google.com"
    end
    
    it "should not be valid with an invaid homepage_url" do
      FactoryGirl.build(:organization, :homepage_url => "foo").should_not be_valid
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
    
    it "should respond to cache_review_stats" do
      FactoryGirl.build(:organization).should respond_to(:cache_review_stats)
    end
  end
  
  describe "geocoder" do
    it "should set the lat/lon" do
      organization = FactoryGirl.create(:organization, :address => "19081", :latitude => nil, :longitude => nil)
      organization.latitude.should == 40.7143528
      organization.longitude.should == -74.0059731
    end
  end
  
  describe "clean_url" do
    describe "yelp" do
      it "should remove the url_params" do
        organization = FactoryGirl.create(:organization, :url => "http://www.yelp.com/biz/12?a=b")
        organization.url_type.should == "yelp"
        organization.url.should == "http://www.yelp.com/biz/12"
      end
      
      it "should remove the url_params without http://" do
        organization = FactoryGirl.create(:organization, :url => "www.yelp.com/biz/12?a=b")
        organization.url_type.should == "yelp"
        organization.url.should == "http://www.yelp.com/biz/12"
      end
    end
    
    describe "non-yelp" do
      it "should not be valid" do
        organization = FactoryGirl.build(:organization, :url => "http://www.yelp.com/bz/12?a=b")
        organization.should_not be_valid
      end
    end
  end

  describe "instance methods" do
    describe "update cache" do
      it "should respond_to update_cache" do
        FactoryGirl.build(:organization).should respond_to(:update_cache)
      end
      
      it "should create a new Cache::ReviewStat" do
        organization = FactoryGirl.create(:organization)
        condition_id = 1
        expect {
          organization.update_cache(condition_id)
        }.to change(Cache::ReviewStat, :count).by(1)
        Cache::ReviewStat.last.condition_id.should eq(condition_id)
      end
      
      it "should not create a new Cache::ReviewStat if it already exists" do
        organization = FactoryGirl.create(:organization)
        condition_id = 1
        review_cache = FactoryGirl.create(:cache_review_stat, :organization => organization, :condition_id => condition_id)
        expect {
          organization.update_cache(condition_id)
        }.to_not change(Cache::ReviewStat, :count)
      end
    end
  end
end
