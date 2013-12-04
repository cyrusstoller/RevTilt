set :application, 'revtilt'
set :repo_url, 'git@github.com:cyrusstoller/RevTilt.git'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }
set :branch, proc { ENV["REVISION"] || ENV["BRANCH_NAME"] || "master" }

set :deploy_to, '/var/www/revtilt'
set :scm, :git

set :format, :pretty
set :log_level, :debug
set :pty, true

set :linked_files, %w{config/database.yml .env}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 10

set :rbenv_type, :user
set :rbenv_ruby, '2.0.0-p353'
set :bundle_flags, "--deployment" # removing the --quiet flag

set :nginx_conf_path, -> { shared_path.join("config/nginx.conf") }

namespace :deploy do
  
  desc "Restart application"
  task :restart do
    invoke "unicorn:restart"
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'

end
