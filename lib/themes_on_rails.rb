require 'themes_on_rails/version'
require 'active_support/concern'

module ThemesOnRails
  autoload :ActionController,    'themes_on_rails/action_controller'
  autoload :ControllerAdditions, 'themes_on_rails/controller_additions'

  def self.all
    Dir.entries('app/themes').sort[2..-1]
  end
end

require 'themes_on_rails/railtie' if defined?(Rails)