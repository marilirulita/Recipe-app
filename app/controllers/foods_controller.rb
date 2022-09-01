class FoodsController < ApplicationController
  before_action :authenticate_user!
  def index
    @my_foods = Food.where(user: current_user)
    @user_one=User.first
  end

  def new
    @new_food = Food.new
  end

  def create
    @new_food = Food.new(user: current_user, name: params[:name], price: params[:price],
                         measurement_unit: params[:measurement_unit])
    @new_food.save!
    redirect_to user_foods_path
  end

  def destroy
    Food.find(params[:id]).destroy
    redirect_to user_foods_path
  end
end
