module Private
  class RecipesController < PrivateController

    def create
      recipe = Recipe.new(params_recipe)

      if recipe.save
        meal = Meal.find(params[:meal_id])
        meal.recipe = recipe
        meal.save
      end

      respond_to do |format|
        format.html
        format.js
      end
    end

    def update
      recipe = Recipe.find(params[:id])
      recipe.update_attributes(params_recipe)
      respond_to do |format|
        format.html
        format.js
      end
    end


    protected

    def params_recipe
      params.require(:recipe).permit([:name])
    end

  end
end
