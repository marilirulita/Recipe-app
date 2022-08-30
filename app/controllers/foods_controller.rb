class FoodsController < ApplicationController
  # TODO: require user to login for all the actions
  def index
    @my_foods = Food.where(user: current_user)
  end

  def show
    puts 'showing a spacific food'
  end

  def new; end

  def create; end

  def destroy
    Food.find(params[:id]).destroy
  end
end
