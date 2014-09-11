require "themes_on_rails/version"
require "active_support/concern"

module ThemesOnRails
  autoload :ActionController,    "themes_on_rails/action_controller"
  autoload :ControllerAdditions, "themes_on_rails/controller_additions"

  autoload :ActionMailer,    "themes_on_rails/action_mailer"
  autoload :MailerAdditions, "themes_on_rails/mailer_additions"
end

require "themes_on_rails/railtie" if defined?(Rails)