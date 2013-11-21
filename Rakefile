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

task :default => "spec:all"

namespace :spec do
  %w(rails_40 rails_32).each do |gemfile|
    desc "Run Tests against #{gemfile}"
    task gemfile => "db:test:prepare" do
      ENV["RAILS_ENV"] = "test"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle --quiet"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle exec rake spec"
    end
  end

  desc "Run Tests against rails versions"
  task :all => "db:test:prepare" do
    ENV["RAILS_ENV"] = "test"
    %w(rails_40 rails_32).each do |gemfile|
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle --quiet"
      sh "BUNDLE_GEMFILE='gemfiles/#{gemfile}.gemfile' bundle exec rake spec"
    end
  end
end