json.array! @games do |game|
  json.extract! game, :id, :date, :signup_time, :max_capacity, :attendees_count
  json.signups game.signups do |signup|
    json.attendee signup.user.username
    json.signup_status signup.attendee_status.name
  end
end
