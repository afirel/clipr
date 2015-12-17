RAILS_ROOT = File.expand_path('..', File.dirname(__FILE__)) + '/'
worker_processes Integer(ENV['UNICORN_WORKERS'] || 2)
preload_app true
timeout 60 * 60
# Also listen on port for easier clustering
listen 3000
logger Logger.new($stdout)
pid '/usr/src/app/tmp/pids/unicorn.pid'
working_directory '/usr/src/app'

before_exec do |server|
  ENV["BUNDLE_GEMFILE"] = '/usr/src/app/Gemfile'
end
