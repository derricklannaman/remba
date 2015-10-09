class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  devise_group :stylist, contains: [:user]

  def after_sign_in_path_for resource
    if resource.present?
      if resource.is_a? Stylist
        dashboard_path
      elsif resource.is_a? Member
        fashionboard_path
      end
    else
      root_path
    end
  end

end
