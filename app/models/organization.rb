# == Schema Information
# Schema version: 20130424221615
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
#  address          :string(255)
#  display_location :string(255)
#

class Organization < ActiveRecord::Base
  attr_accessible :address, :category_id, :latitude, :longitude, :name, :url

  # Validations
  validates_presence_of :category_id
  validates_presence_of :name
  validates_presence_of :url
  validates_uniqueness_of :url

  # Database Relationships
  has_many :organization_user_relationships, :class_name => "Relationships::OrganizationUser", :foreign_key => "organization_id", 
           :dependent => :destroy
  has_many :reviews, :class_name => "Review", :foreign_key => "organization_id"
  has_many :users, :through => :organization_user_relationships, :source => :user
  
  # URL cleaning
  format_url :url
  before_validation :clean_url
  
  # Geocoding
  geocoded_by :address
  after_validation :geocode, :if => :address_changed?
  
  reverse_geocoded_by :latitude, :longitude do |obj,results|
    if geo = results.first
      obj.display_location = [geo.city, geo.state_code, geo.postal_code].join(", ")
    end
  end
  after_validation :reverse_geocode
  
  # Class Methods
  def self.category_options
    return { "activities" => 1, 
             "childcare" => 2, 
             "dentist" => 3, 
             "doctors" => 4, 
             "haircut / salons" => 5, 
             "restaurants" => 6, 
             "schools" => 7, 
             "therapists" => 8 }
  end
  
  # Instance Methods
  def category_text
    Organization.category_options.select { |k,v| v == category_id }.keys[0] rescue "MISC"
  end
  
  private
  
  def clean_url
    
  end
end
