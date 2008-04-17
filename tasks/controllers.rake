require File.dirname(__FILE__) + '/../../config/environment'
require 'app/controllers/application'

def controllers
  controllers = []
  Dir.glob(File.join('app', 'controllers', '**', '*.rb')).entries.each do |file|
    if file =~ /_controller/ 
      controllers << file.gsub('app/controllers/','').gsub('.rb','').camelize
    end
  end
  controllers
end

desc "List all controllers"
task :controllers => :environment do
  controllers.each { |controller| puts controller }
end

namespace :controllers do

  desc "List all actions per controller"
  task :actions => :environment do
    controllers.each do |controller|
      actions = eval("#{controller}.action_methods").sort
      puts "#{controller}\n\t#{actions.join(', ')}"
    end
  end

  desc "Report on total actions vs RESTfully named actions"
  task :restful => :environment do
    names = %w(index show new create edit update destroy)
    actions = []
    controllers.each do |controller|
      eval("#{controller}.action_methods").sort.each { |action| actions << action }
    end
    restfuls = actions.select { |action| names.include?(action) }
    puts <<-EOS
    #{restfuls.size} RESTfully named actions
    #{actions.size} total actions
    #{sprintf('%2.2d', (restfuls.size.to_f / actions.size.to_f) * 100)}% RESTfully named
    EOS
  end

end
