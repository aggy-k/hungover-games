class Game < ApplicationRecord
  belongs_to :timeslot
  belongs_to :game_status
  belongs_to :user
end
