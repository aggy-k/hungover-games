class Game < ApplicationRecord
  belongs_to :game_status
  belongs_to :user
  belongs_to :location
  # belongs_to :timeslot
  has_many :signups
  has_many :users, through: :signups

  validates :date, :signup_time, :start_time, :end_time, :max_capacity, presence: true
  validates :max_capacity, numericality: { only_integer: true }

  # scope :is_private, -> (is_private) {where(is_private: (is_private == "true")) }

  def total_headcount
    return self.signups.count
  end

  def signed_up_count
    return self.signups.count {|signup| signup.attendee_status.name == "Signed-up"}
  end

  def waitlist_count
    return self.signups.count {|signup| signup.attendee_status.name == "Waitlisted"}
  end

  def cancelled_count
    return self.signups.count {|signup| signup.attendee_status.name == "Cancelled"}
  end

  def late_cancelled_count
    return self.signups.count {|signup| signup.attendee_status.name == "Late-cancelled"}
  end

  def no_show_count
    return self.signups.count {|signup| signup.attendee_status.name == "No-show"}
  end

  def removed_count
    return self.signups.count {|signup| signup.attendee_status.name == "Removed"}
  end

  def signup_opens
    t = Time.now
    st = self.signup_time

    return t > st
  end

  def now
    return Time.now
  end
end


