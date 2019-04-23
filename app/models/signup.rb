class Signup < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :attendee_status
end
