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

describe Relationships::OrganizationUser do
  describe "validations" do
    it "should be valid" do
      FactoryGirl.build(:relationships_organization_user).should be_valid
    end
    
    it "should not be valid without an organization_id" do
      FactoryGirl.build(:relationships_organization_user, :organization_id => nil).should_not be_valid
    end
    
    it "should not be valid without a user_id" do
      FactoryGirl.build(:relationships_organization_user, :user_id => nil).should_not be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond_to :organization" do
      FactoryGirl.build(:relationships_organization_user).should respond_to(:organization)
    end
    
    it "should respond_to :user" do
      FactoryGirl.build(:relationships_organization_user).should respond_to(:user)
    end
  end
end
