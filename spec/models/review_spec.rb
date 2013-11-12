# == Schema Information
# Schema version: 20130424042424
#
# Table name: reviews
#
#  id              :integer          not null, primary key
#  rating          :integer
#  content         :text
#  user_id         :integer
#  condition_id    :integer
#  organization_id :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe Review do
  describe "validations" do
    it "should be valid" do
      FactoryGirl.build(:review).should be_valid
    end
    
    it "should not be valid without content" do
      FactoryGirl.build(:review, :content => nil).should_not be_valid
    end
    
    it "should not be valid without a rating" do
      FactoryGirl.build(:review, :rating => nil).should_not be_valid
    end
    
    it "should not be valid without a user_id" do
      FactoryGirl.build(:review, :user_id => nil).should_not be_valid
    end
    
    it "should not be valid without a condition_id" do
      FactoryGirl.build(:review, :condition_id => nil).should_not be_valid
    end
    
    it "should not be valid without an organization_id" do
      FactoryGirl.build(:review, :organization_id => nil).should_not be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond to user" do
      FactoryGirl.build(:review).should respond_to(:user)
    end
    
    it "should respond to organization" do
      FactoryGirl.build(:review).should respond_to(:organization)
    end
  end
  
  describe "scopes" do
    it "should respond to with_condition" do
      Review.should respond_to(:with_condition)
    end
    
    it "should respond to reverse_chronological" do
      Review.should respond_to(:reverse_chronological)
    end
    
    it "should return only the Cache::ReviewStat with that condition" do
      r1 = FactoryGirl.create(:review, :condition_id => 1)
      r2 = FactoryGirl.create(:review, :condition_id => 2)
      Review.with_condition(1).should eq([r1])
    end
  end
  
  describe "callbacks" do
    
    describe "update_cache!" do
      before(:each) do
        @organization = FactoryGirl.create(:organization)
      end
      
      it "should send update_cache to the organization model" do
        condition_id = 1
        @organization.should_receive(:update_cache!).with(condition_id).once
        FactoryGirl.create(:review, :organization => @organization, :condition_id => condition_id)
      end
      
      it "should send update_cache to the organization model on an update" do
        condition_id = 1
        review = FactoryGirl.create(:review, :organization => @organization, :condition_id => condition_id)
        @organization.should_receive(:update_cache!).with(condition_id).once
        review.rating = 2
        review.save!
      end
      
      it "should not send update_cache to the organization model on an update if the rating didn't change" do
        condition_id = 1
        review = FactoryGirl.create(:review, :organization => @organization, :condition_id => condition_id)
        @organization.should_not_receive(:update_cache!).with(condition_id)
        review.content = "foo"
        review.save!
      end
      
      it "should send update_cache to the organization model on destroy" do
        condition_id = 1
        review = FactoryGirl.create(:review, :organization => @organization, :condition_id => condition_id)
        @organization.should_receive(:update_cache!).with(condition_id).once
        review.destroy
      end
      
      it "should send update_cahce to the organization model twice if the condition_id is changed" do
        condition_id = 1
        new_condition_id = 2
        
        review = FactoryGirl.create(:review, :organization => @organization, :condition_id => condition_id)
        @organization.should_receive(:update_cache!).with(condition_id)
        @organization.should_receive(:update_cache!).with(new_condition_id)
        
        review.condition_id = new_condition_id
        review.save!
      end
    end
  end
end
