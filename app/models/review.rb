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

class Review < ActiveRecord::Base
  attr_accessible :condition_id, :content, :organization_id, :rating
  
  # Validations
  validates_presence_of :condition_id
  validates_presence_of :content
  validates_presence_of :organization_id
  validates_presence_of :rating
  validates_presence_of :user_id
  
  # Database Relationships
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  belongs_to :organization, :class_name => "Organization", :foreign_key => "organization_id"
  
  scope :with_condition, Proc.new { |n| where(:condition_id => n) }
end
