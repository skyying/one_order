class MealController < ApplicationController
  def no_meal_foods
    @meal = Meal.includes(:meal_foods).where(meal_foods: { meal_id: nil }).all.map(&:name)
    json_response(@meal)
  end
end
