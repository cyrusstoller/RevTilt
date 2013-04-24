# == Schema Information
# Schema version: 20130423222405
#
# Table name: organizations
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  url              :string(255)
#  url_type         :string(255)
#  latitude         :float
#  longitude        :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  category_id      :integer
#  display_location :string(255)
#

class Organization < ActiveRecord::Base
  attr_accessible :category_id, :latitude, :longitude, :name, :url, :url_type

  # Validations
  validates_presence_of :category_id
  validates_presence_of :name
  validates_presence_of :url

  # Database Relationships
  has_many :organization_user_relationships, :class_name => "Relationships::OrganizationUser", :foreign_key => "organization_id"
  has_many :reviews, :class_name => "Review", :foreign_key => "organization_id"
  has_many :users, :through => :organization_user_relationships, :source => :user
  
  # Class Methods
  def self.category_options
    return [["activities", 1], 
            ["childcare", 2], 
            ["dentist", 3], 
            ["doctors", 4], 
            ["haircut / salons", 5], 
            ["restaurants", 6], 
            ["schools", 7], 
            ["therapists", 8]]
  end
  
  # Instance Methods
  def category_text
    Organization.category_options[self.category_id - 1][0] rescue "MISC"
  end
end
