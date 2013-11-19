module ThemesOnRails
  module Generators
    class ThemeGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)
      argument    :theme_name, type: :string
      desc        "Creates a new theme"

     def create_theme
        empty_directory "app/themes"
        directory       "theme", "app/themes/#{theme_name}"
        empty_directory "app/themes/#{theme_name}/images/#{theme_name}"
        empty_directory "app/themes/#{theme_name}/javascripts/#{theme_name}"
        empty_directory "app/themes/#{theme_name}/stylesheets/#{theme_name}"
      end
    end
  end
end