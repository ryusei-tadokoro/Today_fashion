# config/initializers/google_cloud.rb

require 'google/cloud/vision'

Google::Cloud.configure do |config|
  config.project_id = ENV['GOOGLE_CLOUD_PROJECT']
  config.credentials = JSON.parse(ENV['GOOGLE_CREDENTIALS'])
end