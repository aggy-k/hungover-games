# GameStatus.create!(is_active: true)
# GameStatus.create!(is_active: false)

# Timeslot.create!(
#   day: "Sunday",
#   start_time: Time.parse("5:30 PM"),
#   end_time: Time.parse("7:30 PM"),
#   default_signup_time: Time.parse("2019-04-22 12:00 PM")
#   )
# Timeslot.create!(
#   day: "Sunday",
#   start_time: Time.parse("3:00 PM"),
#   end_time: Time.parse("5:00 PM"),
#   default_signup_time: Time.parse("2019-04-22 12:30 PM")
#   )
# Timeslot.create!(
#   day: "Tuesday",
#   start_time: Time.parse("8:00 PM"),
#   end_time: Time.parse("10:00 PM"),
#   default_signup_time: Time.parse("2019-04-22 12:00 PM")
#   )

attendee_statuses = ["signed-up", "waitlisted", "cancelled", "late-cancelled", "no-show", "removed"]

attendee_statuses.each do |status|
  AttendeeStatus.create!(name: status)
  puts "Created status: #{status}"
end
