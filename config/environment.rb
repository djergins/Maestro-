# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
MaestroWebapp::Application.initialize!
Rails::Initializer do |config|
  config.action_view[:debug_rjs] = true
end
