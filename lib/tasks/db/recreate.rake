  namespace :db do
    desc "Recreate database. Drop, create, migrate and seed it."
    task :recreate => [:drop, :create, :migrate, :seed]
  end
