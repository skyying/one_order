class MealFood < ApplicationRecord
  has_many :food
  has_many :meal
end
