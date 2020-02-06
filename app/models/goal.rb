class Goal < ApplicationRecord
  belongs_to :matchday
  belongs_to :user
end
