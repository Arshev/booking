class Car < ApplicationRecord
  belongs_to :user

  acts_as_bookable  time_type: :range,
                    capacity_type: :none,
                    bookable_across_occurrences: true
end
