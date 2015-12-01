require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "72ce9560993cb0081131179a274bf2fcd5fa3ac7ca1b11dbb63ed0c29ebfd54b"

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
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
