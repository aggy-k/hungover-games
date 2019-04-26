json.array! @games do |game|
  json.extract! game, :id, :max_capacity, :attendees_count
  json.date game.date
  json.start_time game.start_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.end_time game.end_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.signup_date game.signup_time.in_time_zone("Beijing").strftime("%Y-%m-%d")
  json.signup_time game.signup_time.in_time_zone("Beijing").strftime("%l:%M %p")

  json.signups game.signups do |signup|
    json.attendee signup.user.username
    json.signup_status signup.attendee_status.name
  end
end
