class Matchday < ApplicationRecord
  belongs_to :user
  belongs_to :sports_ground
  has_many :spots
  has_many :goals
end
