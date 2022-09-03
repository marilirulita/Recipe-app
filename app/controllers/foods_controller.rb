class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_foods = Food.where(user: current_user)
  end

  def new
    @new_food = Food.new
  end

  def create
    @new_food = Food.new(user: current_user, name: params[:name], price: params[:price],
                         measurement_unit: params[:measurement_unit], quantity: params[:quantity])
    @new_food.save!
    redirect_to foods_path
  end

  def destroy
    destroy_food = Food.find(params[:id])
    RecipeFood.where(food: destroy_food).destroy_all
    destroy_food.destroy
    redirect_to foods_path
  end
end
