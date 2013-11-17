$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "themes_on_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "themes_on_rails"
  s.version     = ThemesOnRails::VERSION
  s.authors     = ["Chamnap Chhorn"]
  s.email       = ["chamnapchhorn@gmail.com"]
  s.homepage    = "https://github.com/chamnap/themes_on_rails"
  s.summary     = "Adds multi themes support to your Rails application"
  s.description = "Adds multi themes support to your Rails application"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.0.1"
end
