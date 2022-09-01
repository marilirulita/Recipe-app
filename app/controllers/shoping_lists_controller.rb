class ShopingListsController < ApplicationController
  before_action :authenticate_user!
  def index
    # the list of food that is missing for all recipes of the logged-in user
    @shoping_lists = Food.select('foods.name, sum(foods.quantity) as quantity, sum(foods.price) as price')
      .where(user: current_user)
      .joins(:recipe_foods, :recipes)
      .where.not(recipes: { user: current_user }).group(:name)
  end
end
