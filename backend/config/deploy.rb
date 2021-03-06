lock '3.6.0'

set :repo_url,  'git@github.com:michaelhoste/cliche.git'
set :repo_tree, 'backend'

set :keep_releases, 30

set :use_sudo,  false
set :log_level, :debug
set :pty,       true

set :linked_files, %w{.env.production}
set :linked_dirs,  %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

set :rbenv_type, 'user'

set :bundle_binstubs, nil
set :bundle_bins,     %w(gem rake rails)
