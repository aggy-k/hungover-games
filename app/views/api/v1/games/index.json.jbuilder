json.games @games do |game|
  json.extract! game, :id, :max_capacity, :attendees_count, :waitlist_count, :total_headcount, :location, :description, :announcement
  json.date game.date

  json.start_time game.start_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.end_time game.end_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.signup_date game.signup_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")

  json.signup_time game.signup_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.signup_opens false

  json.startTime game.start_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.endTime game.end_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.signUpDate game.signup_time.in_time_zone("Beijing").strftime("%Y-%m-%d")
  json.signUpTime game.signup_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.game_status game.game_status

  # USER SIGNUP STATUS COUNT
  json.userSignedUp game.signups.count { |signup| signup.attendee_status.name == "Signed-up" }
  json.userWaitlisted game.signups.count { |signup| signup.attendee_status.name == "Waitlisted" }
  json.userCancelled game.signups.count { |signup| signup.attendee_status.name == "Cancelled" }

  # SIGNUP OBJECTS
  json.signups game.signups do |signup|
    json.id signup.id
    json.user_id signup.user.id
    json.attendee signup.user.username
    json.profile_image signup.user.profile_image
    json.signup_status signup.attendee_status.name
    json.created_at signup.created_at
    json.updated_at signup.updated_at
  end
end

json.pastGames @past_games do |game|
  json.extract! game, :id, :max_capacity, :attendees_count, :waitlist_count, :total_headcount, :location, :description, :announcement
  json.date game.date

  json.start_time game.start_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.end_time game.end_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.signup_date game.signup_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")

  json.signup_time game.signup_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.signup_opens false

  json.startTime game.start_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.endTime game.end_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.signUpDate game.signup_time.in_time_zone("Beijing").strftime("%Y-%m-%d")
  json.signUpTime game.signup_time.in_time_zone("Beijing").strftime("%l:%M %p")
  json.game_status game.game_status

  # USER SIGNUP STATUS COUNT
  json.userSignedUp game.signups.count { |signup| signup.attendee_status.name == "Signed-up" }
  json.userWaitlisted game.signups.count { |signup| signup.attendee_status.name == "Waitlisted" }
  json.userCancelled game.signups.count { |signup| signup.attendee_status.name == "Cancelled" }

  # SIGNUP OBJECTS
  json.signups game.signups do |signup|
    json.id signup.id
    json.user_id signup.user.id
    json.attendee signup.user.username
    json.profile_image signup.user.profile_image
    json.signup_status signup.attendee_status.name
    json.created_at signup.created_at
    json.updated_at signup.updated_at
  end
end
