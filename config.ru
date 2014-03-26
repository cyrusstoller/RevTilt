# Based on the following article:
# https://www.digitalocean.com/community/articles/how-to-optimize-unicorn-workers-in-a-ruby-on-rails-app
# --- Start of unicorn worker killer code ---

if ENV['RAILS_ENV'] == 'production'
  require 'unicorn/worker_killer'

  max_request_min =  500
  max_request_max =  600

  # Max requests per worker
  use Unicorn::WorkerKiller::MaxRequests, max_request_min, max_request_max

  oom_min = (240) * (1024**2)
  oom_max = (260) * (1024**2)

  # Max memory size (RSS) per worker
  use Unicorn::WorkerKiller::Oom, oom_min, oom_max
end

# --- End of unicorn worker killer code ---

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
run RevTilt::Application
