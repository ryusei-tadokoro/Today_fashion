# frozen_string_literal: true

set :output, "log/cron.log"
set :environment, 'production'

every 1.day, at: '6:00 am' do
  runner "PushLineJob.perform_later"
end
