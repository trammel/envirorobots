# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'envirorobots/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'envirorobots'
  s.version     = Envirorobots::VERSION
  s.authors     = ['Jonathon Padfield']
  s.email       = ['jonathon.padfield@gmail.com']
  s.homepage    = 'https://github.com/trammel/envirorobots'
  s.summary     = 'Environmentally specific robots.txt'
  s.description = 'Envirormentally specific robots.txt'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.required_ruby_version = '>= 3.0.1'

  s.add_dependency 'rails'
  s.add_development_dependency 'ammeter'
  s.add_development_dependency 'brakeman'
  s.add_development_dependency 'codecov'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'simplecov'
end
