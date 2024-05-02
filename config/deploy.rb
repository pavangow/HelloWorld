# config valid for current version and patch releases of Capistrano
lock "~> 3.18.1"

# Define your server and user
server '13.60.64.135', user: 'ubuntu', roles: %w{web app db}

# SSH options
set :ssh_options, {
  forward_agent: true,
  auth_methods: %w[publickey],
  keys: %w[/home/blubirch/Downloads/pavanpractice.pem]
}

# Application name
set :application, "helloworld"

# Git repository URL
set :repo_url, 'https://github.com/pavangow/HelloWorld.git'

# Deployment directory
set :deploy_to, '/home/ubuntu/helloworld'

# Use sudo for deployment (if needed)
set :use_sudo, true

# Default branch
set :branch, 'main'

# Linked files and directories
set :linked_files, %w{config/master.key config/database.yml}
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Rails environment
set :rails_env, 'production'

# Number of releases to keep
set :keep_releases, 2

# Puma configuration
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/#{fetch(:application)}-puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.access.log"
set :puma_error_log,  "#{release_path}/log/puma.error.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, true

# Ensure required directories for Puma
namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end
  before :start, :make_dirs
end

