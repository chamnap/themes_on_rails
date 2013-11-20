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

  it "exists `app/themes/basic_blue/assets/javascripts/basic_blue/all.js`" do
    expect(file("app/themes/basic_blue/assets/javascripts/basic_blue/all.js")).to exist
  end

  it "exists `app/themes/basic_blue/assets/stylesheets/basic_blue`" do
    expect(file("app/themes/basic_blue/assets/stylesheets/basic_blue")).to exist
  end

  it "exists `app/themes/basic_blue/assets/stylesheets/basic_blue/all.css`" do
    expect(file("app/themes/basic_blue/assets/stylesheets/basic_blue/all.css")).to exist
  end

  context "layout file: haml" do
    before(:all)  {
      Rails.configuration.app_generators.rails[:template_engine] = :haml
    }
    subject { file("app/themes/basic_blue/views/layouts/basic_blue.html.haml") }

    it { should exist }
    it { should contain(/\= stylesheet_link_tag    \"basic_blue\/all\"/) }
    it { should contain(/\= javascript_include_tag \"basic_blue\/all\"/) }
  end

  context "layout file: erb" do
    before(:all)  {
      Rails.configuration.app_generators.rails[:template_engine] = :erb
    }
    after(:all)  {
      Rails.configuration.app_generators.rails[:template_engine] = :haml
    }
    subject { file("app/themes/basic_blue/views/layouts/basic_blue.html.erb") }

    it { should exist }
    it { should contain(/\= stylesheet_link_tag    \"basic_blue\/all\"/) }
    it { should contain(/\= javascript_include_tag \"basic_blue\/all\"/) }
  end
end