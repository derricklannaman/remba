class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    if stylist_sign_up?
      new_sign_up_user
      @user.status = "Stylist"
    elsif member_sign_up?
      new_sign_up_user
      @user.status = "Member"
    else
      default_user
    end
    save_and_redirect_user
  end

  private

  def new_sign_up_user
    @user = User.new(user_params)
  end

  def default_user
    params[:user][:stylist] = 0
    new_sign_up_user
    @user.status = "Member"
  end

  def save_and_redirect_user
    @user.save
    if @user.save
      sign_in_and_redirect @user
    else
      render :new
    end
  end

  def member_sign_up?
    if params[:user][:stylist] == 'no'
      params[:user][:stylist] = 0
    end
  end

  def stylist_sign_up?
    if params[:user][:stylist].downcase == 'yes'
      params[:user][:stylist] = 1
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :stylist, :email, :password, :password_confirmation)
  end

end