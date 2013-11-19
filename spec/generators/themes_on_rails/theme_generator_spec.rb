require 'spec_helper'

# Generators are not automatically loaded by Rails
require 'generators/themes_on_rails/theme_generator'

describe ThemesOnRails::Generators::ThemeGenerator do
  # Tell the generator where to put its output (what it thinks of as Rails.root)
  destination File.expand_path("../../../../../spec/dummy/tmp", __FILE__)

  before do
    prepare_destination
    run_generator %w(basic_blue)
  end

  it "exists `app/themes`" do
    expect(file("app/themes")).to exist
  end

  it "exists `app/themes/basic_blue`" do
    expect(file("app/themes/basic_blue")).to exist
  end

  it "exists `app/themes/basic_blue/assets/images/basic_blue`" do
    expect(file("app/themes/basic_blue/assets/images/basic_blue")).to exist
  end

  it "exists `app/themes/basic_blue/assets/javascripts/basic_blue`" do
    expect(file("app/themes/basic_blue/assets/javascripts/basic_blue")).to exist
  end

  it "exists `app/themes/basic_blue/assets/stylesheets/basic_blue`" do
    expect(file("app/themes/basic_blue/assets/stylesheets/basic_blue")).to exist
  end
end