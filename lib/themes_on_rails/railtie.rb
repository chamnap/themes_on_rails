module ThemesOnRails
  class Railtie < ::Rails::Railtie

    initializer "themes_on_rails.configure_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include ThemesOnRails::ControllerAdditions
      end
    end

  end
end