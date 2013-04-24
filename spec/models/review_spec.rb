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
end
