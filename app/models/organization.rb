# == Schema Information
# Schema version: 20130417181129
#
# Table name: organizations
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  url_type   :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Organization < ActiveRecord::Base
  attr_accessible :latitude, :longitude, :name, :url, :url_type
end
