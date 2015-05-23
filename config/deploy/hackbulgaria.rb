server '188.166.49.111', user: 'hack', roles: %w(web app db)
server '77.70.99.57', user: 'hack', roles: %w(grader)

set :repo_url, 'git://github.com/HackBulgaria/maycamp_arena.git'

set :deploy_to, '/hack/maycamp_arena'
set :rails_env, 'production'
set :user, 'hack'

set :rvm_type, :user

namespace :puma do
  noop = proc {}

  %i(start stop restart check smart_restart add_default_hooks).each do |task_name|
    task(task_name, &noop)
  end
end

after 'deploy:finished', 'restart arena service' do
  on roles(:app), in: :sequence, wait: 1 do
    execute :sudo, :stop, :arena
    execute :sudo, :start, :arena
  end
end
