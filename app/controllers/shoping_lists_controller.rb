class ShopingListsController < ApplicationController
  before_action :authenticate_user!
  layout 'user'
  def index
    # the list of food that is missing for all recipes of the logged-in user
    @shoping_lists = Food.select('foods.name, sum(foods.quantity) as quantity, sum(foods.price) as price')
      .where(user: current_user)
      .joins(:recipe_foods, :recipes).select('count(recipes.name) as recipes')
      .where.not(recipes: { user: current_user })
      .group(:name)
      @total_value=@shoping_lists.reduce(0) {|sum,list| sum+list.price}
      @total_amount=@shoping_lists.length
      if params[:sort]
      @shoping_lists=sort_helper(params[:row],params[:order])
      end
  end
end
  def sort_helper(row= 'price', order='asc')
    case row
    when 'price'
      return @shoping_lists.sort_by{|store| store.price} unless order!='asc'
      @shoping_lists.sort_by{|store| store.price}
      return @shoping_lists.reverse
    else
      return @shoping_lists.sort_by{|store| store.quantity} unless order!='asc'
      @shoping_lists.sort_by{|store| store.quantity}
      return @shoping_lists.reverse
    end
  end
