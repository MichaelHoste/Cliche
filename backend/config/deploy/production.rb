require 'dotenv'
Dotenv.load('.env.development')

server ENV['DEPLOY_HOSTNAME'], user:  ENV['DEPLOY_SSH_USER'],
                               roles: %w{web app db}

set :application,  'cliche-backend'
set :deploy_to,    "/home/#{ENV['DEPLOY_SSH_USER']}/apps/cliche-backend"
set :branch,       'master'
set :rbenv_ruby,   File.read('.ruby-version').strip
