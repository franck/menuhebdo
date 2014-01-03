module Private
  class RecipesController < PrivateController

    def index
      @recipes = Recipe.paginate(page: params[:page])
    end

    def search 
      @recipes = Recipe.where("name like ?", "%#{params[:term]}%").limit(10).pluck(:name)
      render json: @recipes
    end

    def new
      @recipe = Recipe.new
    end

    def create
      @recipe = Recipe.where(name: params[:recipe][:name]).first_or_create

      respond_to do |format|
        if @recipe.save
          set_meal(@recipe, params[:meal_id])
          format.html { redirect_to private_recipes_path }
          format.js
        else
          format.html { render :new }
          format.js
        end
      end

    end

    def edit
      @recipe = Recipe.find(params[:id])
    end

    def update
      @recipe = Recipe.where(name: params[:recipe][:name]).first_or_create


      respond_to do |format|
        if @recipe.update_attributes(params_recipe)
          set_meal(@recipe, params[:meal_id])
          format.html { redirect_to private_recipes_path }
          format.js
        else
          if params[:recipe][:name].blank? && params[:meal_id]
            unseat_meal(params[:meal_id])
          end
          format.html { render :edit }
          format.js
        end
      end
    end

    def destroy
      recipe = Recipe.find(params[:id])
      recipe.destroy
      redirect_to private_recipes_path
    end


    protected

    def params_recipe
      params.require(:recipe).permit([:name])
    end

    def set_meal(recipe, meal_id)
      return unless meal_id.present?
      meal = Meal.find(meal_id)
      if meal
        meal.recipe = recipe
        meal.save
      end
    end

    def unseat_meal(meal_id)
      meal = Meal.find(meal_id)
      if meal
        meal.recipe_id = nil
        meal.save
      end
    end

  end
end
