class User < ApplicationRecord
  has_many :games
  has_many :signups
  validates :type, presence: true, inclusion: { in: ['player', 'admin'] }
end
