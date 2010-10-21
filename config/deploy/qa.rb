qa_host = "192.168.100.234"
role :app, qa_host
#role :web, qa_host
#role :db, qa_host, :primary => true
set :stage, :qa
set :rails_env, :qa
