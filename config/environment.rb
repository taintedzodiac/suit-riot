# Load the rails application
require File.expand_path('../application', __FILE__)


SuitRiot::Application.configure do
   # config the tweet-button gem
   config.gem "tweet-button"
end

# Initialize the rails application
SuitRiot::Application.initialize!