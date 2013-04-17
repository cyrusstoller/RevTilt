RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include Devise::TestHelpers, :type => :helper
  config.include Warden::Test::Helpers, :type => :request
end