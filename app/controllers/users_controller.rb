class UsersController < ApplicationController
  before_action :authenticate_user!
  layout 'user'
  def index
    redirect_to user_path(id: current_user)
  end

  def show; end
end
