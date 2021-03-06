require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PaintballApi
  class Application < Rails::Application

    config.api_only = true
    config.autoload_paths += %W(\#{config.root}/lib)
    config.generators do |g|
      g.test_framework :minitest, spec: true
    end
  end
end
