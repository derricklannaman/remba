class UsersController < ApplicationController
  def index
    @users = User.all.select { |user| user != current_user }
  end

  def show
    @user = current_user
  end

  def update_profile_image
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to :back
  end


  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_image,
                                 :stylist, :email, :password, :password_confirmation)
  end


end