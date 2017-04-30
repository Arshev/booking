class Car < ApplicationRecord
  belongs_to :user

  acts_as_bookable
end
