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

  validates_presence_of :category_id
  validates_presence_of :name
  validates_presence_of :url

  has_many :organization_user_relationships, :class_name => "Relationships::OrganizationUser", :foreign_key => "organization_id"
  has_many :reviews, :class_name => "Review", :foreign_key => "organization_id"
  has_many :users, :through => :organization_user_relationships, :source => :user
end
