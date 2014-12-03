class Feedback < ActiveRecord::Base
  has_many :workouts
  has_many :users, through: :workouts
end
