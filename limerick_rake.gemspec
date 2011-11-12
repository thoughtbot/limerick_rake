# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "limerick_rake/version"

Gem::Specification.new do |s|
  s.name        = "limerick_rake"
  s.version     = LimerickRake::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["the Ruby community", "thoughtbot, inc."]
  s.email       = "support@thoughtbot.com"
  s.homepage    = "http://github.com/thoughtbot/limerick_rake"
  s.summary     = "A collection of useful rake tasks."
  s.description = "A collection of useful rake tasks."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
