module ThemesOnRails
  class ActionController
    attr_reader :theme_name

    class << self
      def add_before_filter(controller_class, theme, options={})
        filter_method = before_filter_method(options)
        controller_class.send(filter_method, options.slice(:only, :except, :if, :unless)) do |controller|
          controller.class.theme_controller_class.new(controller, theme, options.except(:only, :except, :if, :unless)).send(:set_theme)
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

    def initialize(controller, theme, options={})
      @controller = controller
      @theme_name = _theme_name(theme)
      @options    = options
    end

    def set_theme
      @controller.prepend_view_path theme_view_path
    end

    def theme_view_path
      "#{prefix_path}/#{@theme_name}/views"
    end

    def prefix_path
      "app/themes"
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