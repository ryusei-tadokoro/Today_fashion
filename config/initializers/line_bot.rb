require 'line/bot'

LineBotApi = Line::Bot::Client.new do |config|
  config.channel_secret = ENV.fetch('LINE_CHANNEL_SECRET', nil)
  config.channel_token = ENV.fetch('LINE_CHANNEL_TOKEN', nil)
end
