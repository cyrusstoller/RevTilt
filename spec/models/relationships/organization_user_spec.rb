# == Schema Information
# Schema version: 20130423230554
#
# Table name: relationships_organization_users
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

describe Relationships::OrganizationUser, :type => :model do
  describe "validations" do
    it "should be valid" do
      expect(FactoryGirl.build(:relationships_organization_user)).to be_valid
    end
    
    it "should not be valid without an organization_id" do
      expect(FactoryGirl.build(:relationships_organization_user, :organization_id => nil)).not_to be_valid
    end
    
    it "should not be valid without a user_id" do
      expect(FactoryGirl.build(:relationships_organization_user, :user_id => nil)).not_to be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond_to :organization" do
      expect(FactoryGirl.build(:relationships_organization_user)).to respond_to(:organization)
    end
    
    it "should respond_to :user" do
      expect(FactoryGirl.build(:relationships_organization_user)).to respond_to(:user)
    end
  end
end
