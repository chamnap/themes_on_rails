# ThemesOnRails [![Build Status](https://travis-ci.org/yoolk/themes_on_rails.png?branch=master)](https://travis-ci.org/yoolk/themes_on_rails) [![Dependency Status](https://gemnasium.com/yoolk/themes_on_rails.png)](https://gemnasium.com/yoolk/themes_on_rails) [![Code Climate](https://codeclimate.com/github/yoolk/themes_on_rails.png)](https://codeclimate.com/github/yoolk/themes_on_rails) [![Coverage Status](https://coveralls.io/repos/yoolk/themes_on_rails/badge.png?branch=master)](https://coveralls.io/r/yoolk/themes_on_rails?branch=master) [![Gem Version](https://badge.fury.io/rb/themes_on_rails.png)](http://badge.fury.io/rb/themes_on_rails)

## Installation

The simplest way to install is to use Bundler.

Add this gem to your Gemfile:

    gem 'themes_on_rails'

If you want to use `themes_on_rails` with `liquid` template, add one more gem to your Gemfile:

    gem 'liquid-rails'

Then, use Bundler to install the gem and its dependencies:

    $ bundle install

## Usage

A theme is composed of three things:

  1. Assets: images, javascripts, stylesheets
  2. Views: templates and layouts (erb, haml, or other template engines)
  3. Locales: locales files if any

### Generator

To generate theme inside your app:

    $ rails g themes_on_rails:theme theme_name

<pre>
app/
  themes/
    [theme_name]/
      assets/
        images/
          [theme_name]/
        stylesheets/
          [theme_name]/
            all.css
        javascripts/
          [theme_name]/
            all.js
      views/
        layouts/
          [theme_name].html.erb
      locales/
</pre>

After you invoke the above command, make sure you restart your rails process.

It's best advisable to namespace your assets directory so that it won't conflict with assets in other themes.

```ruby
image_tag              'theme_a/logo.png' # => app/themes/theme_a/assets/images/theme_a/logo.png
javascript_include_tag 'theme_a/all'      # => app/themes/theme_a/assets/javascripts/theme_a/all.js
stylesheet_link_tag    'theme_a/all'      # => app/themes/theme_a/assets/stylesheets/theme_a/all.css
```

There is an example app at https://github.com/chamnap/themes_on_rails_example.

### Controller

You can set theme in your controllers by using the `theme` declaration. For example:

```ruby
class HomeController < ApplicationController
  theme 'basic'

  def index
    ...
  end
end
```

With this declaration, all of the views rendered by the home controller will use `app/themes/basic/views/home/index.html.erb` as its templates and use `app/themes/basic/views/layouts/basic.html.erb`.

You can use a symbol to defer the choice of theme until a request is processed:

```ruby
class HomeController < ApplicationController
  theme :theme_resolver

  def index
    ...
  end

  private

    def theme_resolver
      params[:theme].presence || 'professional'
    end
end
```

Now, if there is a `params[:theme]`, it will use that theme. Otherwise, it will use **professional** theme.

You can even use an inline method, such as a **Proc**, to determine the theme. For example, if you pass a **Proc** object, the block you give the **Proc** will be given the controller instance, so the theme can be determined based on the current request:

```ruby
class HomeController < ApplicationController
  theme Proc.new { |controller| controller.params[:theme].presence || 'professional' }
end
```

Theme specified at the controller level support the `:only` and `:except` options. These options take either a method name, or an array of method names, corresponding to method names within the controller:

```ruby
class HomeController < ApplicationController
  theme 'basic', except: [:rss]
end
```

With this declaration, the **basic** theme would be used for everything but the `rss` index methods.

## Authors

* [Chamnap Chhorn](https://github.com/chamnap)
