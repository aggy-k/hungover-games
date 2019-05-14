json.extract! @user, :id, :profile_image, :username, :admin, :first_name, :last_name
# json.game_count @game_count
json.signup_count @signup_count
json.first_date @signup_count.zero? ? "-" : @first_date.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.quote @user.quote.nil? ? "(edit)" : @user.quote
# json.first_name @user.first_name.nil? ? "(edit)" : @user.first_name
# json.last_name @user.last_name.nil? ? "(edit)" : @user.last_name
