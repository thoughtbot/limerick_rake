Gem::Specification.new do |s|
  s.name = "limerick_rake"
  s.version = "0.0.2"
  s.date = "2008-10-07"
  s.summary = "A collection of useful rake tasks."
  s.email = "support@thoughtbot.com"
  s.homepage = "http://github.com/thoughtbot/limerick_rake"
  s.description = "A collection of useful rake tasks."
  s.authors = ["the Ruby community", "thoughtbot, inc."]
  s.files = ["README.textile",
    "MIT-LICENSE",
    "limerick_rake.gemspec",
    "lib/tasks/backup.rake",
    "lib/tasks/db/bootstrap.rake",
    "lib/tasks/db/indexes.rake",
    "lib/tasks/db/shell.rake",
    "lib/tasks/db/validate_models.rake",
    "lib/tasks/git.rake",
    "lib/tasks/haml_sass.rake",
    "lib/tasks/svn.rake"
  ]
end
