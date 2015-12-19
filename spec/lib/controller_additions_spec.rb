require 'spec_helper'

describe ThemesOnRails::ControllerAdditions do
  let(:controller_class) { Class.new }
  let(:controller)       { controller_class.new }

  before do
    controller_class.send(:include, ThemesOnRails::ControllerAdditions)
  end

  it "invokes #apply_theme without options" do
    expect(ThemesOnRails::ActionController).to receive(:apply_theme).with(controller_class, "theme_a", {})

    controller_class.theme "theme_a"
  end

  it "invokes #apply_theme with options" do
    expect(ThemesOnRails::ActionController).to receive(:apply_theme).with(controller_class, :theme_resolver, { only: [:show] })

    controller_class.theme :theme_resolver, only: [:show]
  end
end