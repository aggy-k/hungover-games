json.extract! @game, :id, :date, :signup_time, :max_capacity, :attendees_count
json.attendees @game.signups do |signup|
  json.username signup.user.username
  json.profile_image signup.user.profile_image
  json.attendee_status signup.attendee_status.name
end
