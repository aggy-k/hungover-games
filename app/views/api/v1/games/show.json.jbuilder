json.extract! @game, :id, :location, :description, :announcement
json.attendeesCount @game.attendees_count
json.maxCapacity @game.max_capacity
json.date @game.date
json.start_time @game.start_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.end_time @game.end_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.signup_time @game.signup_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
# json.day @game.start_time.in_time_zone("Beijing").strftime("%A")
# json.month @game.start_time.in_time_zone("Beijing").strftime("%b")
# json.year @game.start_time.in_time_zone("Beijing").strftime("%Y")
json.startTime @game.start_time.in_time_zone("Beijing").strftime("%H:%M")
json.endTime @game.end_time.in_time_zone("Beijing").strftime("%H:%M")
json.signUpDate @game.signup_time.in_time_zone("Beijing").strftime("%Y-%m-%d")
json.signUpTime @game.signup_time.in_time_zone("Beijing").strftime("%H:%M")
json.gameStatus @game.game_status.is_active
json.timeslot @game.timeslot
json.timeslotString "#{@game.timeslot.day} #{@game.timeslot.start_time.in_time_zone("Beijing").strftime('%l:%M %p')} - #{@game.timeslot.end_time.in_time_zone("Beijing").strftime('%l:%M %p')}"

json.attendees @game.signups do |signup|
  json.username signup.user.username
  json.profileImage signup.user.profile_image
  json.attendeeStatus signup.attendee_status.name
end
