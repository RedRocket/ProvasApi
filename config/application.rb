require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Truckvilleapi
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_job.queue_adapter = :delayed_job

    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.assets.paths << Rails.root.join('vendor', 'assets', 'fonts')
    config.assets.precompile << /\.(?:svg|eot|woff|ttf)$/

    config.middleware.insert_before 0, "Rack::Cors" do
      allow do
        origins '*'
        resource '*',
          :headers => :any,
          :methods => [:get, :post, :delete, :patch, :options]
      end
    end

    CarrierWave.configure do |config|
      config.fog_provider = 'fog/aws'                        # required
      config.fog_credentials = {
        provider:              'AWS',                        # required
        aws_access_key_id:     ENV["S3_ACCESS_KEY"],                        # required
        aws_secret_access_key: ENV["S3_SECRET_ACCESS"],                        # required
        region:                'us-west-2',                  # optional, defaults to 'us-east-1'
        endpoint: 'http://s3-us-west-2.amazonaws.com'
      }
      config.fog_directory  = 'elasticbeanstalk-us-west-2-941352463971',
      config.fog_public     = true,
    end

    ActionMailer::Base.smtp_settings = {
      :user_name => 'SuaProva',
      :password => 'suaprova16',
      :domain => 'http://ec2-35-166-118-16.us-west-2.compute.amazonaws.com',
      :address => 'smtp.sendgrid.net',
      :port => 587,
      :authentication => :plain,
      :enable_starttls_auto => true
    }

    config.time_zone = 'Brasilia'
  end
end
