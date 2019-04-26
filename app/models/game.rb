class Game < ApplicationRecord
  belongs_to :game_status
  belongs_to :user
  has_many :signups
  has_many :users, through: :signups
end
