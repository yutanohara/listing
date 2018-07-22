class HomeController < ApplicationController
  def index
    # render layout: nil
    @user = User.find_by(id: params[:id])
  end

  def show; end
end
