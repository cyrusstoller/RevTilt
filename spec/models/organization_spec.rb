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

require 'spec_helper'

describe Organization do
  # pending "add some examples to (or delete) #{__FILE__}"
end
