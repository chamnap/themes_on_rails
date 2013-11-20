module ThemesOnRails
  module ControllerAdditions
    extend ActiveSupport::Concern

    module ClassMethods
      def theme(theme, options={})
        @_theme         = theme
        @_theme_options = options
        theme_controller_class.add_before_filter(self, theme, options)
      end

      def theme_controller_class
        ThemesOnRails::ActionController
      end
    end
  end
end