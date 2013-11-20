module ThemesOnRails
  module Generators
    class ThemeGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument    :theme_name, type: :string
      desc        "Creates a new theme"

     def create_theme
        empty_directory theme_directory
        empty_directory theme_views_layout
        empty_directory theme_images_directory
        empty_directory theme_javascripts_directory
        empty_directory theme_stylesheets_directory

        copy_file       "all.js", "#{theme_javascripts_directory}/all.js"
        copy_file       "all.css", "#{theme_stylesheets_directory}/all.css"
      end

      private

        def theme_directory
          "app/themes/#{theme_name}"
        end

        def theme_views_layout
          "#{theme_directory}/#{theme_name}/views/layouts"
        end

        def theme_images_directory
          "#{theme_directory}/assets/images/#{theme_name}"
        end

        def theme_javascripts_directory
          "#{theme_directory}/assets/javascripts/#{theme_name}"
        end

        def theme_stylesheets_directory
          "#{theme_directory}/assets/stylesheets/#{theme_name}"
        end
    end
  end
end