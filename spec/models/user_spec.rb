# == Schema Information
# Schema version: 20130424193539
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  authentication_token   :string(255)
#  username               :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

require 'rails_helper'

describe User, :type => :model do
  describe "validations" do
    it "should be valid" do
      expect(FactoryGirl.build(:user)).to be_valid
    end
    
    it "should not be valid without an email" do
      expect(FactoryGirl.build(:user, :email => nil)).not_to be_valid
    end
    
    it "should not be valid without a username" do
      expect(FactoryGirl.build(:user, :username => nil)).not_to be_valid
    end

    it "should not be valid with a username that has already been taken" do
      user1 = FactoryGirl.create(:user)
      expect(FactoryGirl.build(:user, :username => user1.username)).not_to be_valid
    end

    it "should not be valid with a username that has whitespace" do
      expect(FactoryGirl.build(:user, :username => "be cool")).not_to be_valid
    end
  end
  
  describe "database relationships" do
    it "should respond to organization_user_relationships" do
      expect(FactoryGirl.build(:user)).to respond_to(:organization_user_relationships)
    end
    
    it "should respond to favorite_organizations" do
      expect(FactoryGirl.build(:user)).to respond_to(:favorite_organizations)
    end
  end
  
  describe "instance methods" do
    describe "favorite organizations" do
      describe "method existance" do
        it "should respond to favorite!" do
          expect(FactoryGirl.build(:user)).to respond_to(:favorite!)
        end

        it "should respond to unfavorite!" do
          expect(FactoryGirl.build(:user)).to respond_to(:unfavorite!)
        end

        it "should respond to favorited?" do
          expect(FactoryGirl.build(:user)).to respond_to(:favorited?)
        end
      end

      describe "relationship changes" do
        before(:each) do
          @user = FactoryGirl.create(:user)
          @organization = FactoryGirl.create(:organization)
        end
        
        it "should create a Relationships::OrganizationUser" do
          expect {
            @user.favorite!(@organization)
          }.to change(Relationships::OrganizationUser, :count).by(1)
        end
        
        it "should not create a Relationships::OrganizationUser" do
          @user.favorite!(@organization)

          expect {
            @user.favorite!(@organization)
          }.to_not change(Relationships::OrganizationUser, :count)
        end
        
        it "should destroy a Relationships::OrganizationUser" do
          @user.favorite!(@organization)
          
          expect {
            @user.unfavorite!(@organization)
          }.to change(Relationships::OrganizationUser, :count).by(-1)
        end
        
        it "should not destroy a Relationships::OrganizationUser" do
          expect {
            @user.unfavorite!(@organization)
          }.to_not change(Relationships::OrganizationUser, :count)
        end
        
        it "should return true if the user has favorited an @organization" do
          @user.favorite!(@organization)
          res = @user.favorited?(@organization)
          expect(!!res).to eq(true)
        end
        
        it "should return false if the user has not favorited an @organization" do
          res = @user.favorited?(@organization)
          expect(!!res).to eq(false)
        end
      end
    end
  end
end
