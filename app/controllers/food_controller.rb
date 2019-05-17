class FoodController < ApplicationController
  def max_foods
    max_food_hash = Food.joins(:meal_foods).group(:food_id, :name).order("count(*) desc").count
    @max_food = max_food_hash.map { |key, value| [key.last, value] }
    json_response(@max_food)
  end
end
