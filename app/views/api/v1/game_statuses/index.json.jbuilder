json.game_statuses @game_statuses do |gs|
  json.extract! gs, :id, :is_active, :name
end
