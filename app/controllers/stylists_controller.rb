class StylistsController < ApplicationController

  def index
    @stylists = Stylist.all
  end

end
