# config valid for current version and patch releases of Capistrano
lock "~> 3.10.1"

set :application, "filmarks"
set :repo_url, "git@github.com:yudai0308/filmarks.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['/Users/tankazuki/.ssh/filmarks2.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }
set :keep_releases, 5

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'db_seed'
  task :db_seed do
    on roles(:db) do |host|
      with rails_env: fetch(:rails_env) do
        within current_path do
          execute :bundle, :exec, :rake, 'db:seed'
        end
      end
    end
  end
  task :restart do
    invoke 'unicorn:restart'
  end
end

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "/path/to/app/current/Gemfile"
end
