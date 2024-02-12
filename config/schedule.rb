every 1.day, at: '6:00 am' do
  runner "PushLineJob.perform_later"
end
