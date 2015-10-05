class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save && is_a_stylist?
      redirect_to dashboard_path
    elsif @user.save && is_a_member?
      redirect_to fashionboard_path
    else
      render :new
    end
  end


  private

  def is_a_member?
    params[:user][:stylist] == '0'
  end

  def is_a_stylist?
    params[:user][:stylist] == '1'
  end

  def user_params
    params.require(:user).permit(:stylist, :email, :password, :password_confirmation)
  end

end