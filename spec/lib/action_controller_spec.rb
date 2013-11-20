require "spec_helper"

describe ThemesOnRails::ActionController, "#initialize" do
  let(:controller)        { controller_class.new }
  let(:controller_class)  { Class.new }

  it "initializes with theme as string" do
    action_controller = ThemesOnRails::ActionController.new(controller, "basic_blue")

    expect(action_controller.theme_name).to eq("basic_blue")
  end

  it "initializes with theme as symbol method" do
    def controller.theme_resolver
      "basic_blue"
    end
    action_controller = ThemesOnRails::ActionController.new(controller, :theme_resolver)

    expect(action_controller.theme_name).to eq("basic_blue")
  end

  it "initializes with theme as symbol" do
    action_controller = ThemesOnRails::ActionController.new(controller, :basic_blue)

    expect(action_controller.theme_name).to eq("basic_blue")
  end

  it "initializes with theme as proc or lambda" do
    action_controller = ThemesOnRails::ActionController.new(controller, lambda { |con| "basic_blue" })

    expect(action_controller.theme_name).to eq("basic_blue")
  end

  it "initializes with theme as nil" do
    expect {
      ThemesOnRails::ActionController.new(controller, nil)
    }.to raise_error(ArgumentError)
  end
end

describe ThemesOnRails::ActionController, "other methods" do
  let(:controller)        { controller_class.new }
  let(:controller_class)  { Class.new }
  before do
    controller_class.stub(:before_action)
    controller_class.stub(:prepend_before_action)
  end

  it "#theme_view_path" do
    action_controller = ThemesOnRails::ActionController.new(controller, "basic_blue")

    expect(action_controller.theme_view_path).to eq("app/themes/basic_blue/views")
  end

  it "#set_theme" do
    action_controller = ThemesOnRails::ActionController.new(controller, "basic_blue")
    controller.should_receive(:prepend_view_path).with(action_controller.theme_view_path)

    action_controller.set_theme
  end

  it ".add_before_filter without options" do
    controller_class.should_receive(:before_action).with({})

    ThemesOnRails::ActionController.add_before_filter(controller_class, :before_action)
  end

  it ".add_before_filter with :prepend options" do
    controller_class.should_receive(:prepend_before_action).with({})

    ThemesOnRails::ActionController.add_before_filter(controller_class, 'basic_blue', prepend: true)
  end

  it ".add_before_filter with invalid options" do
    controller_class.should_receive(:before_action).with({})

    ThemesOnRails::ActionController.add_before_filter(controller_class, 'basic_blue', invalid: true)
  end
end