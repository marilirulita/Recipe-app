class ShopingListsController < ApplicationController
  before_action :authenticate_user!

  def index
    # Actual recipe
    @recipe = Recipe.find(params[:format])
    @foods = []
    @prices = 0

    food_helper
  end

  private

  def food_helper
    recipe_foods = RecipeFood.where(recipe_id: @recipe.id).includes([:food])
    foods = Food.all

    recipe_foods.each do |recipe_food|
      foods.each do |food|
        if recipe_food.food.id == food.id
          if recipe_food.quantity > food.quantity
            quantity = recipe_food.quantity - food.quantity
            newfood = recipe_food
            newfood.quantity = quantity
            @foods.push(newfood)
            @prices += (quantity * food.price)
          elsif recipe_food.quantity <= food.quantity
            break
          else
            @foods.push(recipe_food)
            @prices += (recipe_food.quantity * food.price)
          end
        end
      end
    end
  end
end
