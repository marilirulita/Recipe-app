class FoodsController < ApplicationController
  # TODO: require user to login for all the actions
  def index
    @my_foods = Food.where(user: current_user)
  end

  def show
    puts 'showing a spacific food'
  end

  def new
    @new_food=Food.new
  end

  def create
    # puts params[:food]
    @new_food=Food.new(user: current_user,name: params[:name], price: params[:price],measurement_unit: params[:measurement_unit])
    @new_food.save!
    redirect_to user_foods_path
  end

  def destroy
    Food.find(params[:id]).destroy
  end
end
