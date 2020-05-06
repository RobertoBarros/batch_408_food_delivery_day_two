require_relative '../views/meals_view'

class MealsController

  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    # Ask to user the meal name
    name = @view.ask_name
    # Ask to user the meal price
    price = @view.ask_price
    # instatiate new meal
    meal = Meal.new(name: name, price: price)
    # Add my new meal in the repository
    @meal_repository.add(meal)
  end

  def list
    meals = @meal_repository.all
    @view.list(meals)
  end

end