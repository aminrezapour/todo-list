class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :authorize_user

  def show
    @user = User.find(params[:id])
    @items = @user.items.all
  end


  private

  def authorize_user
    @user = User.find(params[:id])
    if current_user.id != @user.id
      flash[:alert] = "User profiles are private."
      redirect_to user_path(current_user)
    end
  end

end
