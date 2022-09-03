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

    recipeFoods = RecipeFood.where(recipe_id: @recipe.id).includes([:food])
    foods = Food.all

    recipeFoods.each do |recipeFood|
      foods.each do |food|
        if recipeFood.food.id == food.id
          if recipeFood.quantity > food.quantity
            quantity = recipeFood.quantity - food.quantity
            newfood = recipeFood
            newfood.quantity = quantity
            @foods.push(newfood)
            @prices += (quantity * food.price)
          elsif recipeFood.quantity <= food.quantity
            break
          else
            @foods.push(recipeFood)
            @prices += (recipeFood.quantity * food.price)
          end
        end
      end
    end
  end

end
