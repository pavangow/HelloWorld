# Load DSL and set up stages
require "capistrano/setup"
set :stage, :production

# Include default deployment tasks
require "capistrano/deploy"

# Load the SCM plugin appropriate to your project:
require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git

# Include tasks from other gems included in your Gemfile
require "capistrano/bundler"
require "capistrano/rails/assets"
require "capistrano/rails/migrations"
require "capistrano/rbenv"
require "capistrano/puma"

# Remove this line -> install_plugin Capistrano::Puma
# Instead, use require to include the plugin
require "capistrano/puma"



# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
