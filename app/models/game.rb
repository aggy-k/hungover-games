class Game < ApplicationRecord
  belongs_to :game_status
  belongs_to :user
  # belongs_to :timeslot
  has_many :signups
  has_many :users, through: :signups

  validates :date, :signup_time, :start_time, :end_time, :max_capacity, presence: true
  validates :max_capacity, :attendees_count, numericality: { only_integer: true }
end
