class Signup < ApplicationRecord
  belongs_to :user
  belongs_to :game
  belongs_to :attendee_status

  def late_cancelled?
    ((self.game.start_time - Time.now) / 60 / 60) < 24
  end
end
