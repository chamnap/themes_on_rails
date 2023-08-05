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
      themes_root          = Pathname.new("#{Rails.root}/app/themes")
      allowed_assets_regex = /^[^\/]+\/assets\/(stylesheets|javascripts)\/[^\/]+\/all((_|-).+)?\.(js|css)$/

      Dir.glob(themes_root.join("*/assets/**/*").to_s).each do |entry|
        next unless File.file?(entry)
        # 1. don't allow nested: theme_a/responsive/all.js
        # 2. allow start_with all_ or all-
        # 3. allow all.js and all.css
        relative_entry = Pathname.new(entry).relative_path_from(themes_root).to_s
        if !%w(.js .css).include?(File.extname(entry)) || relative_entry =~ allowed_assets_regex
          app.config.assets.precompile << entry
        end
      end
    end
  end
end
