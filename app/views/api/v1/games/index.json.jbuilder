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

  json.signups game.signups do |signup|
    json.attendee signup.user.username
    json.signup_status signup.attendee_status.name
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

  json.signups game.signups do |signup|
    json.attendee signup.user.username
    json.signup_status signup.attendee_status.name
  end
end
