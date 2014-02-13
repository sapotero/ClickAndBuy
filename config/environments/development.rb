ClickAndBuy::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  ActsAsTaggableOn.remove_unused_tags = true
  ActsAsTaggableOn.force_lowercase = true
    
  config.cache_classes = false

  config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
  config.assets.precompile += %w(.svg .eot .woff .ttf)

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true
  
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.paperclip_defaults = {
  :storage        => :s3,
  :s3_protocol    => 'http',
  :s3_credentials => {
    :bucket            => 'clickandbuy',
    :access_key_id     => 'AKIAJHNEN7RZNC2VG3LA',
    :secret_access_key => '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'
    }
  }
  
end