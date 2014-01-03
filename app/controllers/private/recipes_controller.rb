module Private
  class RecipesController < PrivateController

    def create
      recipe = Recipe.where(name: params[:recipe][:name]).first_or_create

      if recipe.save
        set_meal(recipe, params[:meal_id])
      end

      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      recipe = Recipe.where(name: params[:recipe][:name]).first_or_create

      if recipe.update_attributes(params_recipe)
        set_meal(recipe, params[:meal_id])
      end

      respond_to do |format|
        format.html
        format.js
      end
    end


    protected

    def params_recipe
      params.require(:recipe).permit([:name])
    end

    def set_meal(recipe, meal_id)
      return unless params[:meal_id].present?
      meal = Meal.find(params[:meal_id])
      if meal
        meal.recipe = recipe
        meal.save
      end
    end

  end
end
