# == Schema Information
# Schema version: 20130501214342
#
# Table name: cache_review_stats
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  num_reviews     :integer          default(0)
#  avg_review      :float            default(0.0)
#  condition_id    :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

describe Cache::ReviewStat, :type => :model do
  describe "validations" do
    it "should be valid" do
      expect(FactoryGirl.build(:cache_review_stat)).to be_valid
    end
    
    it "should not be valid without an organization_id" do
      expect(FactoryGirl.build(:cache_review_stat, :organization_id => nil)).not_to be_valid
    end
    
    it "should not be valid without a condition_id" do
      expect(FactoryGirl.build(:cache_review_stat, :condition_id => nil)).not_to be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond to organization" do
      expect(FactoryGirl.build(:cache_review_stat)).to respond_to(:organization)
    end
  end
  
  describe "scopes" do
    it "should respond to with_condition" do
      expect(Cache::ReviewStat).to respond_to(:with_condition)
    end
    
    it "should return only the Cache::ReviewStat with that condition" do
      rc1 = FactoryGirl.create(:cache_review_stat, :condition_id => 1)
      rc2 = FactoryGirl.create(:cache_review_stat, :condition_id => 2)
      expect(Cache::ReviewStat.with_condition(1)).to eq([rc1])
    end
  end
end
