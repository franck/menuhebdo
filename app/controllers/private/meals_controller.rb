#encoding:utf-8
module Private
  class MealsController < PrivateController

    def new
      day = Day.find(params[:day_id])
      meal = day.meals.create
      menu_template = day.menu_template
      redirect_to private_menu_template_path(menu_template)
    end

    def destroy
      meal = Meal.find(params[:id])
      day = meal.day
      menu_template = day.menu_template
      meal.destroy
      redirect_to private_menu_template_path(menu_template), notice: "#{MealPresenter.new(meal).name} supprimé"
    end

  end
end
