# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Esmfamil::Application.initialize!
config.action_mailer.default_url_options = { :host => 'https://calm-tundra-9478.herokuapp.com' }
