json.extract! @game, :id, :location, :description, :announcement

# json.attendeesCount @game.total_headcount
json.signedUpCount @game.signed_up_count
json.waitlistCount @game.waitlist_count
json.cancelledCount @game.cancelled_count
json.lateCancelledCount @game.late_cancelled_count
json.noShowCount @game.no_show_count
json.removedCount @game.removed_count

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
json.isPrivate @game.is_private

json.attendees @game.signups.order("signups.id ASC") do |signup|
  json.id signup.id
  json.userId signup.user.id
  json.username signup.user.username
  json.player signup.player
  json.profileImage signup.user.profile_image
  json.attendeeStatus signup.attendee_status.name
  json.previousStatus signup.previous_status
  json.isPaid signup.is_paid
  json.created_at signup.created_at.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.updated_at signup.updated_at.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
end

