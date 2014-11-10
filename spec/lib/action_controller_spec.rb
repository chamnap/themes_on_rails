require "spec_helper"

describe ThemesOnRails::ActionController do
  let(:controller)        { controller_class.new }
  let(:controller_class)  { Class.new }

  it "initializes with theme as string" do
    action_controller = ThemesOnRails::ActionController.new(controller, "theme_a")

    expect(action_controller.theme_name).to eq("theme_a")
  end

  it "initializes with theme as symbol method" do
    def controller.theme_resolver
      "theme_a"
    end
    action_controller = ThemesOnRails::ActionController.new(controller, :theme_resolver)

    expect(action_controller.theme_name).to eq("theme_a")
  end

  it "initializes with theme as symbol" do
    action_controller = ThemesOnRails::ActionController.new(controller, :theme_a)

    expect(action_controller.theme_name).to eq("theme_a")
  end

  it "initializes with theme as proc or lambda" do
    action_controller = ThemesOnRails::ActionController.new(controller, lambda { |con| "theme_a" })

    expect(action_controller.theme_name).to eq("theme_a")
  end

  it "initializes with theme as nil" do
    expect {
      ThemesOnRails::ActionController.new(controller, nil)
    }.to raise_error(ArgumentError)
  end

  it "#theme_view_path" do
    action_controller = ThemesOnRails::ActionController.new(controller, "theme_a")

    expect(action_controller.theme_view_path).to eq("#{Rails.root}/app/themes/theme_a/views")
  end
end