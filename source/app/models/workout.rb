class Workout < ActiveRecord::Base
  validate :date_cannot_be_in_the_past
end

def event_date_cannot_be_in_the_past
  if date.present? && date < Date.today
    errors.add(:date, "can't be in the past")
  end
end
