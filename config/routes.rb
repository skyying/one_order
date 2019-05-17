Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get "/no_meal_foods", to: "meal#no_meal_foods"
  get "/max_foods", to: "food#max_foods"
end
