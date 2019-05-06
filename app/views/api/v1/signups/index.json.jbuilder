json.signups @signups do |signup|
  json.extract! signup, :id, :attendee_status
  json.game signup.game
  json.start_time signup.game.start_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.end_time signup.game.end_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
end

json.pastSignups @past_signups do |signup|
  json.extract! signup, :id, :attendee_status
  json.game signup.game
  json.start_time signup.game.start_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
  json.end_time signup.game.end_time.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
end
