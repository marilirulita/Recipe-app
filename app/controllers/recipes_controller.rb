class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: %i[show edit destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = current_user.recipes.all
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit; end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(recipe_food_params)
    redirect_to recipe_path(@recipe_food.recipe)
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = current_user.recipes.new(recipe_params)

    if @recipe.save
      flash[:success] = 'Your recipe has been created!'
      redirect_to recipes_path
    else
      flash[:error] = 'Recipe not created!'
      redirect_to new_recipe_path
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe = current_user.recipes.find(params[:id])
    @recipe.destroy
    redirect_to request.referrer
  end

  def toggle_public
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe.public = !@recipe.public

    redirect_to recipe_path(@recipe.id), notice: 'Recipe updated' if @recipe.save
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = current_user.recipes.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
