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

require 'rails_helper'

describe Organization, :type => :model do
  describe "validation" do
    it "should be valid" do
      expect(FactoryGirl.build(:organization)).to be_valid
    end
    
    it "should not be valid without a category_id" do
      expect(FactoryGirl.build(:organization, :category_id => nil)).not_to be_valid
    end
    
    it "should not be valid without a name" do
      expect(FactoryGirl.build(:organization, :name => nil)).not_to be_valid
    end
    
    it "should not be valid without a url" do
      expect(FactoryGirl.build(:organization, :url => nil)).not_to be_valid
    end
    
    it "should not be valid with the smae url" do
      organization = FactoryGirl.create(:organization)
      expect(FactoryGirl.build(:organization, :url => organization.url)).not_to be_valid
    end
    
    it "should be valid with a homepage_url" do
      expect(FactoryGirl.build(:organization, :homepage_url => "http://www.google.com")).to be_valid
    end
    
    it "should be valid without a homepage_url" do
      expect(FactoryGirl.build(:organization, :homepage_url => nil)).to be_valid
    end
    
    it "should be valid with a homepage_url sans http" do
      organization = FactoryGirl.build(:organization, :homepage_url => "www.google.com")
      expect(organization).to be_valid
      expect(organization.homepage_url).to eq("http://www.google.com")
    end
    
    it "should not be valid with an invaid homepage_url" do
      expect(FactoryGirl.build(:organization, :homepage_url => "foo")).not_to be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond to organization_user_relationships" do
      expect(FactoryGirl.build(:organization)).to respond_to(:organization_user_relationships)
    end
    
    it "should respond to reviews" do
      expect(FactoryGirl.build(:organization)).to respond_to(:reviews)
    end
    
    it "should respond to users" do
      expect(FactoryGirl.build(:organization)).to respond_to(:users)
    end
    
    it "should respond to cache_review_stats" do
      expect(FactoryGirl.build(:organization)).to respond_to(:cache_review_stats)
    end
  end
  
  describe "geocoder" do
    it "should set the lat/lon" do
      organization = FactoryGirl.create(:organization, :address => "19081", :latitude => nil, :longitude => nil)
      expect(organization.latitude).to eq(40.7143528)
      expect(organization.longitude).to eq(-74.0059731)
    end
  end
  
  describe "clean_url" do
    describe "yelp" do
      it "should remove the url_params" do
        organization = FactoryGirl.create(:organization, :url => "http://www.yelp.com/biz/12?a=b")
        expect(organization.url_type).to eq("yelp")
        expect(organization.url).to eq("http://www.yelp.com/biz/12")
      end
      
      it "should remove the url_params without http://" do
        organization = FactoryGirl.create(:organization, :url => "www.yelp.com/biz/12?a=b")
        expect(organization.url_type).to eq("yelp")
        expect(organization.url).to eq("http://www.yelp.com/biz/12")
      end
    end
    
    describe "non-yelp" do
      it "should not be valid" do
        organization = FactoryGirl.build(:organization, :url => "http://www.yelp.com/bz/12?a=b")
        expect(organization).not_to be_valid
      end
    end
  end

  describe "class methods" do
    describe "with_url" do
      it "should return the organization with the same url" do
        organization = FactoryGirl.create(:organization)
        expect(Organization.with_url(organization.url)).to eq(organization)
      end
      
      it "should return nil if there is no organization with that url" do
        organization = FactoryGirl.create(:organization)
        expect(Organization.with_url(organization.url[0..-2])).to be_nil
      end
    end
    
    describe "category_text" do
      it "should return 'other'" do
        expect(Organization.category_text(0)).to eq("other")
      end
    end
  end

  describe "instance methods" do
    describe "update_cache!" do
      it "should respond_to update_cache!" do
        expect(FactoryGirl.build(:organization)).to respond_to(:update_cache!)
      end
      
      it "should create a new Cache::ReviewStat" do
        organization = FactoryGirl.create(:organization)
        condition_id = 1
        expect {
          organization.update_cache!(condition_id)
        }.to change(Cache::ReviewStat, :count).by(1)
        expect(Cache::ReviewStat.last.condition_id).to eq(condition_id)
      end
      
      it "should not create a new Cache::ReviewStat if it already exists" do
        organization = FactoryGirl.create(:organization)
        condition_id = 1
        review_cache = FactoryGirl.create(:cache_review_stat, :organization => organization, :condition_id => condition_id)
        expect {
          organization.update_cache!(condition_id)
        }.to_not change(Cache::ReviewStat, :count)
      end
      
      it "should set the num_reviews and average review" do
         organization = FactoryGirl.create(:organization)
         condition_id = 1
         review_cache = FactoryGirl.create(:cache_review_stat, :organization => organization, :condition_id => condition_id)
         
         review1 = FactoryGirl.create(:review, :organization => organization, :condition_id => condition_id, :rating => 3)
         review2 = FactoryGirl.create(:review, :organization => organization, :condition_id => condition_id, :rating => 2)
         
         organization.update_cache!(condition_id)
         
         review_cache.reload
         expect(review_cache.num_reviews).to eq(2)
         expect(review_cache.avg_review).to eq(2.5)
      end
      
      it "should not set the avg_review to nil when there are no reviews" do
        organization = FactoryGirl.create(:organization)
        condition_id = 1
        review_cache = FactoryGirl.create(:cache_review_stat, :organization => organization, :condition_id => condition_id)
                
        organization.update_cache!(condition_id)
        
        review_cache.reload
        expect(review_cache.num_reviews).to eq(0)
        expect(review_cache.avg_review).to eq(0)
      end
    end
  end
end
