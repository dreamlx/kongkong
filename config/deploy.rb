set :rvm_ruby_string, :local               # use the same ruby as used locally for deployment
set :rvm_autolibs_flag, "read-only"        # more info: rvm help autolibs

before 'deploy:setup', 'rvm:install_rvm'   # install RVM
before 'deploy:setup', 'rvm:install_ruby'  # install Ruby and create gemset, OR:
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
require 'rvm/capistrano' 

# main details
set :application, "kongkong"
set :keep_releases, 10 
role :web, "42.120.9.87"                          # Your HTTP server, Apache/etc
role :app, "42.120.9.87"                          # This may be the same as your `Web` server
role :db,  "42.120.9.87", :primary => true # This is where Rails migrations will run
#role :db,  "3dtzk.com"

#server details
default_run_options[:pty] = true  # Must be set for the password prompt
set :deploy_to, "/home/dreamlinx/ROR/kongkong.com"
set :user, "dreamlinx"
set :use_sudo, false
set :ssh_options, { :forward_agent => true }
#repo details
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :scm_username, "dreamlx"
set :scm_passphrase, "github2melx"
set :repository,  "git@github.com:dreamlx/kongkong.git"
set :branch, "master"
set :deploy_via, :remote_cache


#tasks
namespace :deploy do
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
  
  task :stop, :roles => :app do
    #do nonthing
  end
  
  desc "Symlink shared resources on each release - not used"
  task :symlink_shared, :roles => :app do
    #run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  
  task :change_db , :roles => :app do
    run "mv #{release_path}/config/database.yml #{release_path}/config/database.yml.orig"
    run "mv #{release_path}/config/database.yml.server #{release_path}/config/database.yml"
  end


  task :precompile, :roles => :web do  
    run "cd #{current_path} && #{rake} RAILS_ENV=production assets:precompile"  
  end  

end

after "deploy:update", "deploy:migrate"
after "deploy:migrate", "deploy:symlink_shared"
after "deploy:migrate", "deploy:precompile"

after 'deploy:update_code', 'deploy:change_db'
# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
