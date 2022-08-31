class RecipeFoodsController < ApplicationController
  # GET /recipe_foods/new
  def new
    @recipe = Recipe.find(params[:recipe_id])
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.save
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe)
  end

  private

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
