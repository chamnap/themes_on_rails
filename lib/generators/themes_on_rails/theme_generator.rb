module ThemesOnRails
  module Generators
    class ThemeGenerator < Rails::Generators::Base
      argument    :theme_name, type: :string
      desc        "Creates a new theme"

     def create_theme
        empty_directory "app/themes"
        empty_directory "app/themes/#{theme_name}/views/layouts"
        empty_directory "app/themes/#{theme_name}/assets/images/#{theme_name}"
        empty_directory "app/themes/#{theme_name}/assets/javascripts/#{theme_name}"
        empty_directory "app/themes/#{theme_name}/assets/stylesheets/#{theme_name}"
      end
    end
  end
end