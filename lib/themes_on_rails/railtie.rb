module ThemesOnRails
  class Railtie < ::Rails::Railtie

    initializer "themes_on_rails.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include ThemesOnRails::ControllerAdditions
      end
    end

    initializer "themes_on_rails.assets_path" do |app|
      Dir.glob("#{Rails.root}/app/themes/*/assets/*").each do |dir|
        app.config.assets.paths << dir
      end
    end

  end
end