$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "envirorobots/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "envirorobots"
  s.version     = Envirorobots::VERSION
  s.authors     = ["Jonathon Padfield"]
  s.email       = ["jonathon.padfield@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Envirorobots."
  s.description = "TODO: Description of Envirorobots."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.3"
end
