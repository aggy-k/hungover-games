json.extract! @game, :id, :location, :description, :announcement
json.attendeesCount @game.attendees_count
json.maxCapacity @game.max_capacity
json.date @game.date
json.startTime @game.start_time.in_time_zone("Beijing").strftime("%l:%M %p")
json.endTime @game.end_time.in_time_zone("Beijing").strftime("%l:%M %p")
json.signUpDate @game.signup_time.in_time_zone("Beijing").strftime("%Y-%m-%d")
json.signUpTime @game.signup_time.in_time_zone("Beijing").strftime("%l:%M %p")
json.gameStatus @game.game_status.is_active

json.attendees @game.signups do |signup|
  json.username signup.user.username
  json.profileImage signup.user.profile_image
  json.attendeeStatus signup.attendee_status.name
end
