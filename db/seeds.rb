
# Location.create!(
#   name: 'Cages',
#   address: "3F, Jing'An Sports Center, Jiangning road 428 江宁路428号静安体育中心3层",
#   long: 121.452879,
#   lat: 31.235168)

# if User.count == 0
#   User.create!(first_name: "Admin", last_name: "One", admin: true)
#   puts "Created #{User.count} fake admin user"
# end


# if GameStatus.count == 0
#   puts "Creating Game Statuses.."
#   GameStatus.create!(is_active: true, name: "Active")
#   GameStatus.create!(is_active: false, name: "Cancelled")
#   puts "Created #{GameStatus.count} game statuses."
# end

# if Timeslot.count == 0
#   puts "Creating Timeslots.."
#   Timeslot.create!(
#     day: "Sunday",
#     start_time: Time.parse("5:30 PM"),
#     end_time: Time.parse("7:30 PM"),
#     default_signup_time: Time.parse("2019-04-22 12:00 PM")
#     )
#   Timeslot.create!(
#     day: "Sunday",
#     start_time: Time.parse("3:00 PM"),
#     end_time: Time.parse("5:00 PM"),
#     default_signup_time: Time.parse("2019-04-22 12:30 PM")
#     )
#   Timeslot.create!(
#     day: "Tuesday",
#     start_time: Time.parse("8:00 PM"),
#     end_time: Time.parse("10:00 PM"),
#     default_signup_time: Time.parse("2019-04-22 12:00 PM")
#     )
#   # Timeslot.create!(
#   #   day: 'Other'
#   #   )
#   puts "Created #{Timeslot.count} timeslots."
# end

# if AttendeeStatus.count == 0
#   puts "Creating Attendee Statuses.."
#   attendee_statuses = ["Signed-up", "Waitlisted", "Cancelled", "Late-cancelled", "No-show", "Removed"]

  # attendee_statuses.each do |status|
  #   AttendeeStatus.create!(name: status)
  #   puts "Created status: #{status}"
  # end

#   puts "Created #{AttendeeStatus.count} attendee statuses."
# end

# puts "Destroying existing signups and games..."
# Signup.destroy_all if Rails.env.development?
# Game.destroy_all if Rails.env.development?

# puts "Creating fake games..."
# Game.create!(
#   user: User.first,
#   date: Date.parse("2019-05-05"),
#   signup_time: Time.parse("2019-05-01 12:00 PM"),
#   game_status: GameStatus.find_by(is_active: true),
#   location: "Cages, Jingan",
#   max_capacity: 28,
#   start_time: Time.parse("17:00"),
#   end_time: Time.parse("19:00"),
#   timeslot: Timeslot.all.sample
#   )
# Game.create!(
#   user: User.first,
#   date: Date.parse("2019-05-08"),
#   signup_time: Time.parse("2019-05-03 12:30 PM"),
#   game_status: GameStatus.find_by(is_active: true),
#   location: "Cages, Jingan",
#   max_capacity: 24,
#   start_time: Time.parse("17:30"),
#   end_time: Time.parse("19:30"),
#   timeslot: Timeslot.all.sample
#   )
# Game.create!(
#   user: User.first,
#   date: Date.parse("2019-05-15"),
#   signup_time: Time.parse("2019-05-09 12:00 PM"),
#   game_status: GameStatus.find_by(is_active: true),
#   location: "Cages, Jingan",
#   max_capacity: 28,
#   start_time: Time.parse("15:00"),
#   end_time: Time.parse("17:00"),
#   timeslot: Timeslot.all.sample
#   )
# puts "Created #{Game.count} fake games."


