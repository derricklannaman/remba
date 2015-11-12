class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :fashion_team

  def after_sign_in_path_for resource
    if resource.present?
      if resource.status == "Stylist"
        dashboard_path
      elsif resource.status == "Member"
        fashionboard_path
      end
    else
      root_path
    end
  end

  def locals values
    render locals: values
  end

  def fashion_team
    current_user.team
  end

end
