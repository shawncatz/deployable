$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "deployable/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "deployable"
  s.version     = Deployable::VERSION
  s.authors     = ["Shawn Catanzarite"]
  s.email       = ["me@shawncatz.com"]
  s.homepage    = "https://github.com/shawncatz/deployable"
  s.summary     = "common deployment stuff"
  s.description = "common deployment stuff"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 0.75.0"
  s.add_dependency "foreman", "~> 3.2.1"
  s.add_dependency "capistrano", "~> 3.2.1"
  s.add_dependency "capistrano-bundler", "~> 1.1.3"
  s.add_dependency "capistrano-rails", "~> 1.1.2"
  s.add_dependency "capistrano-rails-console", "~> 0.2.0"
  s.add_dependency "capistrano-rvm", "~> 0.1.1"
  s.add_dependency "whenever", "~> 0.9.2"

  s.add_development_dependency "sqlite3"
end
