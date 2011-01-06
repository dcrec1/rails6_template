namespace :db do
  desc "Bootstraps the database with demo data"
  task :bootstrap => %w(db:setup) do
    
  end
end
