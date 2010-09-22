namespace :db do
  desc 'Launches the database shell using the values defined in config/database.yml'
  task :shell => :environment do
    config = ActiveRecord::Base.configurations[Rails.env || 'development']
    command = ""

    case config['adapter']
    when 'mysql'
      command << "mysql "
      command << "--host=#{config['host'] || 'localhost'} "
      command << "--port=#{config['port'] || 3306} "
      command << "--user=#{config['username'] || 'root'} "
      command << "--password=#{config['password'] || ''} "
      command << config['database']
    when 'postgresql'
      command << "psql "
      command << "-h #{config['host']} " unless config['host'].blank?
      command << "-p #{config['port']} " unless config['port'].blank?
      command << "-U #{config['username']} " unless config['username'].blank?
      if config['password'].blank?
        command << "#{config['database']}"
      else
        command << "\"dbname=#{config['database']} password=#{config['password']}\""
      end
    else
      command << "echo Unsupported database adapter: #{config['adapter']}"
    end
    system command
  end
end
