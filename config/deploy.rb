# config valid only for current version of Capistrano
lock '3.7.1'

set :application, 'provas'
set :repo_url, 'git@github.com:RedRocket/ProvasApi.git' # Edit this to match your repository
set :branch, :master
set :deploy_to, '/home/deploy/provas'
set :pty, true
set :linked_files, %w{config/database.yml config/application.yml}
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
set :keep_releases, 5
set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.3.3' # Edit this if you are using MRI Ruby

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_error.log"
set :puma_error_log, "#{shared_path}/log/puma_access.log"
set :puma_role, :app
set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
set :puma_threads, [0, 1]
set :puma_workers, 4
set :puma_worker_timeout, nil
set :puma_init_active_record, true
set :puma_preload_app, false

set :rollbar_token, '58947bc1309c4f19a8093716a7f1adcf'
set :rollbar_env, Proc.new { fetch :stage }
set :rollbar_role, Proc.new { :app }
set :delayed_job_workers, 2

set :delayed_job_pid_dir, '/tmp'
