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

require 'spec_helper'

describe Organization do
  # pending "add some examples to (or delete) #{__FILE__}"
end
