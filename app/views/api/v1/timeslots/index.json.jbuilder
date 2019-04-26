json.array! @timeslots do |t|
  json.extract! t, :id, :day
  json.start_time t.start_time.in_time_zone("Beijing").strftime('%l:%M %p')
  json.end_time t.end_time.in_time_zone("Beijing").strftime('%l:%M %p')
  json.signup_time t.default_signup_time.in_time_zone("Beijing").strftime('%l:%M %p')
end
