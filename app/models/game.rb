class Game < ApplicationRecord
  belongs_to :game_status
  belongs_to :user
  belongs_to :location
  # belongs_to :timeslot
  has_many :signups
  has_many :users, through: :signups

  validates :date, :signup_time, :start_time, :end_time, :max_capacity, presence: true
  validates :max_capacity, :attendees_count, numericality: { only_integer: true }

  def signup_opens
    t = Time.now
    st = self.signup_time

    return t > st
  end

  def now
    return Time.now
  end
end


