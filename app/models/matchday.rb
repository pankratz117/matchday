class Matchday < ApplicationRecord
  belongs_to :user
  belongs_to :sports_ground
end
