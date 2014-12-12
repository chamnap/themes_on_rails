require 'themes_on_rails/version'
require 'themes_on_rails/engine'
require 'active_support/concern'

module ThemesOnRails
  autoload :ActionController,    'themes_on_rails/action_controller'
  autoload :ControllerAdditions, 'themes_on_rails/controller_additions'

  def self.all
    Dir.glob("app/themes/*").select { |fn| !fn.start_with?('.') && File.directory?(fn) }.map { |fn| fn.split('/').last }
  end
end