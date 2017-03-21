module ThemesOnRails
  module ControllerAdditions
    extend ActiveSupport::Concern

    class_methods do
      def theme(theme, options={})
        @_theme         = theme
        @_theme_options = options
        ThemesOnRails::ActionController.apply_theme(self, theme, options)
      end
    end
  end
end
