json.extract! @game, :id, :location, :description, :announcement

json.attendeesCount @game.attendees_count
json.signedUpCount @signed_up_count
json.waitlistCount @waitlist_count
json.cancelledCount @cancelled_count
json.lateCancelledCount @late_cancelled_count
json.noShowCount @no_show_count
json.removedCount @removed_count

json.maxCapacity @game.max_capacity
json.date @game.date
json.start_time @game.start_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.end_time @game.end_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.signup_time @game.signup_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.startTime @game.start_time.in_time_zone("Beijing").strftime("%H:%M")
json.endTime @game.end_time.in_time_zone("Beijing").strftime("%H:%M")
json.signUpDate @game.signup_time.in_time_zone("Beijing").strftime("%Y-%m-%d")
json.signUpTime @game.signup_time.in_time_zone("Beijing").strftime("%H:%M")
json.gameStatus @game.game_status.is_active

json.attendees @game.signups do |signup|
  json.id signup.id
  json.username signup.user.username
  json.profileImage signup.user.profile_image
  json.attendeeStatus signup.attendee_status.name
  json.updated_at signup.updated_at.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
end

