require 'rails/generators'

module ThemesOnRails
  class Engine < ::Rails::Engine
    initializer 'themes_on_rails.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        include ThemesOnRails::ControllerAdditions
      end
    end

    initializer 'themes_on_rails.load_locales' do |app|
      app.config.i18n.load_path += Dir[Rails.root.join('app/themes/*', 'locales', '**', '*.yml').to_s]
    end

    initializer 'themes_on_rails.assets_path' do |app|
      Dir.glob("#{Rails.root}/app/themes/*/assets/*").each do |dir|
        app.config.assets.paths << dir
      end
    end

    initializer 'themes_on_rails.precompile' do |app|
      app.config.assets.precompile << Proc.new do |path, fn|
        if fn =~ /app\/themes/
          basename = path.split('/').last
          if !%w(.js .css).include?(File.extname(path))
            true
          elsif path =~ /^[^\/]+\/all((_|-).+)?\.(js|css)$/
            # 1. don't allow nested: theme_a/responsive/all.js
            # 2. allow start_with all_ or all-
            # 3. allow all.js and all.css
            true
          else
            false
          end
        end
      end
    end
  end
end
