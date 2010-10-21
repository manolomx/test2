set :stages, %w(local pod staging qa production develop)
require 'capistrano/ext/multistage'

set :application, "test2"
set :repository,  "git@github.com:manolomx/test2.git"
set :scm, :git
set :user, "manolo"
set :branch, "master"
set :use_sudo, false
set :keep_releases, 6
#set :deploy_via, :remote_cache
#set :default_stage, "pod"
set :deploy_to, "/home/#{user}/app"
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

#role :web, "192.168.100.234"                          # Your HTTP server, Apache/etc
role :app, "192.168.100.234 "                          # This may be the same as your `Web` server
#role :db,  "192.168.100.234", :primary => true # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

 namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
 end
