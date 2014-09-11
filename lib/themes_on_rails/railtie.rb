module ThemesOnRails
  class Railtie < ::Rails::Railtie

    initializer "themes_on_rails.action_controller" do |app|
      ActiveSupport.on_load :action_controller do
        include ThemesOnRails::ControllerAdditions
      end
    end

    initializer "themes_on_rails.action_mailer" do |app|
      ActiveSupport.on_load :action_mailer do
        include ThemesOnRails::MailerAdditions
      end
    end

    initializer "themes_on_rails.assets_path" do |app|
      Dir.glob("#{Rails.root}/app/themes/*/assets/*").each do |dir|
        app.config.assets.paths << dir
      end
    end

    initializer "themes_on_rails.precompile" do |app|
      app.config.assets.precompile += [ Proc.new { |path, fn| fn =~ /app\/themes/ && !%w(.js .css).include?(File.extname(path)) } ]
      app.config.assets.precompile += Dir["app/themes/*"].map { |path| "#{path.split('/').last}/all.js" }
      app.config.assets.precompile += Dir["app/themes/*"].map { |path| "#{path.split('/').last}/all.css" }
    end

  end
end