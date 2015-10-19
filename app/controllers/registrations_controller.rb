class RegistrationsController < Devise::RegistrationsController

  def new
    # binding.pry
    @user = User.new
  end

  def create
    if a_stylist?
      # @user = Stylist.new(user_params)
      @user = User.new(user_params)
      @user.status = "Stylist"
    elsif a_member?
      # @user = Member.new(user_params)
      @user = User.new(user_params)
      @user.status = "Member"
    end
    save_and_redirect_user
  end


  private

  def save_and_redirect_user
    @user.save
    if @user.save
      sign_in_and_redirect @user
    else
      render :new
    end
  end

  def a_member?
    params[:user][:stylist] == '0'
  end

  def a_stylist?
    params[:user][:stylist] == '1'
  end

  def user_params
    params.require(:user).permit(:stylist, :email, :password, :password_confirmation)
  end

end