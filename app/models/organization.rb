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
end
