class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    normalize_user_inputs
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

  def normalize_user_inputs
    if params[:user][:first_name].present?
      params[:user][:first_name].capitalize!
    end
    if params[:user][:last_name].present?
      params[:user][:last_name].capitalize!
    end
  end

  def member_sign_up?
    if registered_as_stylist == 'no'
      registered_as_stylist = 0
    end
  end

  def stylist_sign_up?
    if registered_as_stylist.downcase == 'yes'
      registered_as_stylist = 1
    end
  end

  def registered_as_stylist
    params[:user][:stylist]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_image_id,
                                 :stylist, :email, :password, :password_confirmation)
  end

end