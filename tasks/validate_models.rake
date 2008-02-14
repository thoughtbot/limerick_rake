# From http://blog.hasmanythrough.com/2006/8/27/validate-all-your-records
namespace :db do
  desc "Run model validations on all model records in database"
  task :validate_models => :environment do
    # because rails loads stuff on demand...
    Dir.glob(RAILS_ROOT + '/app/models/**/*.rb').each { |file| require file }
    Object.subclasses_of(ActiveRecord::Base).select { |c|
          c.base_class == c}.sort_by(&:name).each do |klass|
      total = klass.count
      chunk_size = 1000
      (total / chunk_size + 1).times do |i|
        chunk = klass.find(:all, :offset => (i * chunk_size), :limit => chunk_size)
        chunk.reject(&:valid?).each do |record|
          puts "  #{klass.name}##{record.id}: #{record.errors.full_messages.join('; ')}"
        end rescue nil
      end
    end
  end
end

