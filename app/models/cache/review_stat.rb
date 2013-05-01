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

class Cache::ReviewStat < ActiveRecord::Base
  attr_accessible :avg_review, :condition_id, :num_reviews, :organization_id
  
  # Validations
  validates_presence_of :organization_id
  validates_presence_of :condition_id
  
  # Database Relationships
  belongs_to :organization, :class_name => "Organization", :foreign_key => "organization_id"
  
  scope :with_condition, Proc.new { |n| where(%("cache_review_stats"."condition_id" = ?), n) }
end
