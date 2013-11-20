require "themes_on_rails/version"
require "active_support/concern"

module ThemesOnRails
  autoload :ActionController,    "themes_on_rails/action_controller"
  autoload :ControllerAdditions, "themes_on_rails/controller_additions"
end

require "themes_on_rails/railtie"