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

  s.add_dependency "rails", "~> 4.1.6"
  s.add_dependency "foreman", "~> 0.75.0"
  s.add_dependency "capistrano", "~> 3.11.1"
  s.add_dependency 'ed25519', '~> 1.2.4'
  s.add_dependency 'bcrypt_pbkdf'
  s.add_dependency "capistrano-bundler", "~> 1.6.0"
  s.add_dependency "capistrano-rails", "~> 1.4.0"
  s.add_dependency "capistrano-rails-console", "~> 2.3.0"
  s.add_dependency "capistrano-rvm", "~> 0.1.1"
  s.add_dependency "whenever", "~> 0.9.2"

  s.add_development_dependency "sqlite3"
end
