server '104.236.28.141', user: 'deploy', roles: %w{web app db}

set :unicorn_worker_count, 4
set :enable_ssl, false