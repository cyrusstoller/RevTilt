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
  # attr_accessible :condition_id, :content, :organization_id, :rating
  
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
  scope :reverse_chronological, -> { order(%("reviews"."id" DESC))}
  
  after_save :update_cache!, :if => Proc.new { rating_changed? or condition_id_changed? }
  after_destroy :update_cache!

  private
  
  def update_cache!
    unless organization.nil?
      organization.update_cache!(condition_id)
    
      if condition_id_changed?
        organization.update_cache!(condition_id_was) unless condition_id_was.nil?
      end
    end
  end
end
