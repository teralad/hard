require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Hard
  class Application < Rails::Application

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: true,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.assets.initialize_on_precompile = false

    config.eager_load = Dir["#{Rails.root}/lib", "#{Rails.root}/lib/**/"]
    config.autoload_paths += Dir["#{Rails.root}/app/models/*/**/"]
    config.autoload_paths += Dir["#{Rails.root}/app/services/*/**/"]
    config.autoload_paths += Dir["#{Rails.root}/app/graphql/*/"]

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
