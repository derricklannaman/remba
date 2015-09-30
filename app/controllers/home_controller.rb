class HomeController < ApplicationController

  def index
    time = Time.now
    @time = time.strftime('%m/%d/%Y')
  end

end
