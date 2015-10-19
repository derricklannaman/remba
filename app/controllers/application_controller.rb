class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # devise_group :stylist, contains: [:user]
  # devise_group :member, contains: [:user]

  def after_sign_in_path_for resource
    if resource.present?
      # if resource.type == "Stylist"
      if resource.status == "Stylist"
        dashboard_path
      # elsif resource.type == "Member"
      elsif resource.status == "Member"
        fashionboard_path
      end
    else
      root_path
    end
  end

end
