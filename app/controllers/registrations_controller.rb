class RegistrationsController < Devise::RegistrationsController

  def new
    @user = User.new
  end

  def create
    if a_stylist?
      @user = Stylist.new(user_params)
      if @user.save
        sign_in_and_redirect @user
      end
    elsif a_member?
      @user = Member.new(user_params)
      if @user.save
        sign_in_and_redirect @user
      end
    else
      render :new
    end
  end


  private



  # def after_sign_in_path_for resource
  #   if resource.present? && (resource.is_a? Stylist)
  #     dashboard_path
  #   elsif resource.present? && (resource.is_a? Member)
  #     fashionboard_path
  #   else
  #     root_path
  #   end
  # end

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