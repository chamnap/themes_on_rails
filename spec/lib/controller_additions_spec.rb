require 'spec_helper'

describe ThemesOnRails::ControllerAdditions do
  let(:controller_class) { Class.new }
  let(:controller)       { controller_class.new }

  before do
    controller_class.send(:include, ThemesOnRails::ControllerAdditions)
  end

  it "invokes #add_before_filter without options" do
    controller_class.theme_controller_class.should_receive(:add_before_filter).with(controller_class, "basic_blue", {})

    controller_class.theme "basic_blue"
  end

  it "invokes #add_before_filter with options" do
    controller_class.theme_controller_class.should_receive(:add_before_filter).with(controller_class, :theme_resolver, { only: [:show] })

    controller_class.theme :theme_resolver, only: [:show]
  end

  it "#theme_controller_class" do
    expect(controller_class.theme_controller_class).to eq(ThemesOnRails::ActionController)
  end
end