# == Schema Information
# Schema version: 20130416210931
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
#

require 'spec_helper'

describe User do
  describe "validations" do
    it "should be valid" do
      FactoryGirl.build(:user).should be_valid
    end
    
    it "should not be valid without an email" do
      FactoryGirl.build(:user, :email => nil).should_not be_valid
    end
    
    it "should not be valid without a username" do
      FactoryGirl.build(:user, :username => nil).should_not be_valid
    end
  end
end
