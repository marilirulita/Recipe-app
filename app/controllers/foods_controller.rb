class FoodsController < ApplicationController
  def index
    @my_foods=Food.where(user: current_user)
  end

  def show
  end

  def new
  end

  def create
  end

  def destroy
  end
end
