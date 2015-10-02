class HomeController < ApplicationController

  def index
    current_date
  end

  def current_date
    time = Time.now
    @time = time.strftime('%m/%d/%Y')
  end

end
