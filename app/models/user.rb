class User < ApplicationRecord
  has_many :games
  has_many :signups
  has_many :game_rules
end
