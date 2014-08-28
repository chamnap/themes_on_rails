if ENV['COVERAGE'] || ENV['CI']
  require 'coveralls'
  require 'simplecov'
  SimpleCov.add_filter 'spec'
  Coveralls.wear!
end

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "themes_on_rails"
require "rspec/rails"
require "ammeter/init"
Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true
end
