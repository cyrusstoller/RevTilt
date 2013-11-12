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

class Relationships::OrganizationUser < ActiveRecord::Base
  # attr_accessible :organization_id, :user_id
  
  validates_presence_of :organization_id
  validates_presence_of :user_id
  
  belongs_to :organization, :class_name => "Organization", :foreign_key => "organization_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
end
