require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "fd63feb3986ace1dd8c6d69d8e03933eb309d44d160466e794d6d195dfdb97e8"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
ActiveSupport.on_load(:active_record) do
  extend Dragonfly::Model
  extend Dragonfly::Model::Validations
end
