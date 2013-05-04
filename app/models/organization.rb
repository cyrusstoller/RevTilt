# == Schema Information
# Schema version: 20130501180835
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
#  homepage_url     :string(255)
#

require "open-uri"

class Organization < ActiveRecord::Base
  attr_accessible :address, :category_id, :homepage_url, :latitude, :longitude, :name, :url

  # Validations
  validates_presence_of :category_id
  validates_presence_of :name
  validates_presence_of :url, :message => "must be a yelp URL"
  validates_uniqueness_of :url
  validates_format_of :homepage_url, with: UrlFormatter.url_regexp, message: "is not a valid URL", if: "homepage_url?"
  
  # Database Relationships
  has_many :organization_user_relationships, :class_name => "Relationships::OrganizationUser", :foreign_key => "organization_id", 
           :dependent => :destroy
  has_many :reviews, :class_name => "Review", :foreign_key => "organization_id"
  has_many :users, :through => :organization_user_relationships, :source => :user
  
  has_many :cache_review_stats, :class_name => "Cache::ReviewStat", :foreign_key => "organization_id", :dependent => :destroy
  
  # URL cleaning
  before_validation :clean_url
  
  # Based on https://github.com/nhocki/url_formatter
  before_validation do
    self.homepage_url = UrlFormatter.format_url(self.homepage_url)
  end
  
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
             "education" => 7, 
             "haircut / salons" => 5, 
             "restaurants" => 6, 
             "therapy - cognitive behavioral" => 10,
             "therapy - occupational" => 9,
             "therapy - speech & language" => 8,
             "therapy - physical" => 12,
             "therapy - other" => 11 }
  end
  
  # Instance Methods
  def category_text
    Organization.category_options.select { |k,v| v == category_id }.keys[0] rescue "MISC"
  end
  
  def update_cache!(condition_id)
    review_cache = cache_review_stats.with_condition(condition_id).first
    
    if review_cache.nil?
      review_cache = cache_review_stats.create(:condition_id => condition_id)
    end
  end
  
  private
  
  def clean_url
    unless url.blank?
      query_url = self.url
      unless query_url =~ /\Ahttps?:\/\//
        query_url = "http://" + query_url
      end
      
      components = URI.split(query_url)
      
      res = ""
      if components[2] =~ /yelp\.com/ and components[5] =~ /\A\/biz\//
        res << "http://www.yelp.com"
        res << components[5]
        self.url_type = "yelp"
      end
      self.url = res
    end
  end
end
