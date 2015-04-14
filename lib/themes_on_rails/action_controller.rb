module ThemesOnRails
  class ActionController
    attr_reader :theme_name

    class << self
      def apply_theme(controller_class, theme, options={})
        filter_method = before_filter_method(options)
        options       = options.slice(:only, :except)

        controller_class.send(filter_method, options) do |controller|

          # set layout
          controller_class.layout Proc.new { |controller|
            ThemesOnRails::ActionController.new(controller, theme).theme_name
          }, options

          # initialize
          theme_instance = ThemesOnRails::ActionController.new(controller, theme)

          return if theme_instance.theme_name.blank?
          # prepend view path
          controller.prepend_view_path theme_instance.theme_view_path

          # liquid file system
          Liquid::Template.file_system = Liquid::Rails::FileSystem.new(theme_instance.theme_view_path) if defined?(Liquid::Rails)
        end
      end

      private

        def before_filter_method(options)
          case Rails::VERSION::MAJOR
          when 3
            options.delete(:prepend) ? :prepend_before_filter : :before_filter
          when 4
            options.delete(:prepend) ? :prepend_before_action : :before_action
          end
        end
    end

    def initialize(controller, theme)
      @controller = controller
      @theme_name = _theme_name(theme)
    end

    def theme_view_path
      "#{prefix_path}/#{@theme_name}/views"
    end

    def prefix_path
      "#{Rails.root}/app/themes"
    end

    private

      def _theme_name(theme)
        case theme
        when String     then theme
        when Proc       then theme.call(@controller).to_s
        when Symbol     then @controller.respond_to?(theme, true) ? @controller.send(theme).to_s : theme.to_s
        else
          raise ArgumentError,
            "String, Proc, or Symbol, expected for `theme'; you passed #{theme.inspect}"
        end
      end
  end
end