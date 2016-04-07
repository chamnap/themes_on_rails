module ThemesOnRails::FileSystemResolverCache
  extend ActiveSupport::Concern

  included do
    @cache = Hash.new
  end

  module ClassMethods
    def new(path, *args)
      @cache[path] ||= super
    end
  end
end
