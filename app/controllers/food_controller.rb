class FoodController < ApplicationController
  def max_foods
    max_food_hash = Food.joins(:meal_foods).group(:food_id, :name).order("count(*) desc").count
    @max_food = max_food_hash.map { |key, value| [key.last, value] }
    json_response(@max_food)
  end

  def other_food
    grouped_food_meal_ids = MealFood.all.group_by { |x| x.food_id }

    food_ids_in_meals = grouped_food_meal_ids.map do |key, value|
      ids = value.map(&:meal_id).map { |id| MealFood.joins(:meal).where(meal_id: id).all.map { |food| food.food_id }}
      [key, ids]
    end

    uniq_food_ids = food_ids_in_meals.map do |item|
      [item.first, item.last.flatten(1).uniq - [item.first]]
    end

    @other_foods = uniq_food_ids.map do |item|
      other_food = item.last.map { |id| Food.find(id).name}
      [Food.find(item.first).name, other_food]
    end

    json_response(@other_foods)
  end
end
