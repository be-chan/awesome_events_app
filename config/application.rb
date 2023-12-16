require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AwesomeEventsApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Rails自体のアプリケーションの時刻設定
    config.time_zone = "Tokyo"

    # ActiveRecordでDBを読み書きする際のタイムゾーンの設定
    config.active_record.default_timezone = :local

    # 日本語にするための設定
    config.i18n.default_locale = :ja
    
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
