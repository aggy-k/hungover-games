json.extract! @game_rule, :id, :title, :content, :user
json.created_at @game_rule.created_at.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
json.updated_at @game_rule.updated_at.in_time_zone("Beijing").strftime("%A, %d %b %Y %l:%M %p")
