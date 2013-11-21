#!/usr/bin/env rake
begin
  require 'bundler/setup'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end

# bunlder tasks
Bundler::GemHelper.install_tasks

# dummy app tasks
require 'rake'
load File.expand_path('spec/dummy/Rakefile')

# spec tasks
require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec, 'db:test:prepare') do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

task :default => "spec:all"

namespace :spec do
  %w(rails_40 rails_32).each do |gemfile|
    desc "Run Tests against #{gemfile}"
    task gemfile do
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle --quiet"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle exec rake spec"
    end
  end

  desc "Run Tests against rails versions"
  task :all do
    %w(rails_40 rails_32).each do |gemfile|
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle --quiet"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle exec rake spec"
    end
  end
end