class MealPresenter

  def initialize(meal)
    @meal = meal
  end

  def name
    "Repas #{@meal.position}"
  end

end
