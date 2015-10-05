class HomeController < ApplicationController

  def index
    current_date
    redirect_to dashboard_path if user_signed_in?
  end

  def current_date
    time = Time.now
    @time = time.strftime('%m/%d/%Y')
  end

end
