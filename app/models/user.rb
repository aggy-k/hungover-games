class User < ApplicationRecord
  has_many :games, dependent: :destroy
  has_many :signups, dependent: :destroy
  has_many :game_rules, dependent: :destroy
end
