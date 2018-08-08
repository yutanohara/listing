class UsersController < ApplicationController
  def index
    redirect_to "/users/sign_up"
  end

  def show
    @user = User.find(params[:id])
  end
end
