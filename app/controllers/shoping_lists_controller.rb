class ShopingListsController < ApplicationController
  before_action :authenticate_user!
  layout 'user'
  def index
    # the list of food that is missing for all recipes of the logged-in user
    @shoping_lists = Food.select('foods.name, foods.measurement_unit,
      sum(foods.quantity) as quantity, sum(foods.price) as price')
      .where(user: current_user)
      .joins(:recipe_foods, :recipes).select('count(recipes.name) as recipes')
      .where.not(recipes: { user: current_user })
      .group(:name, :measurement_unit)
    @total_value = @shoping_lists.reduce(0) { |sum, list| sum + list.price }
    @total_amount = @shoping_lists.length
    @shoping_lists = sort_helper(params[:row], params[:order]) if params[:sort]
  end
end

def sort_helper(row, order)
  case row
  when 'price'
    return @shoping_lists.sort_by(&:price) unless order != 'asc'

    @shoping_lists.sort_by(&:price)
  else
    return @shoping_lists.sort_by(&:name) unless order != 'asc'

    @shoping_lists.sort_by(&:name)
  end
  @shoping_lists.reverse
end
