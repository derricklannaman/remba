class StylistsController < ApplicationController

  def index
    # @stylists = Stylist.all turns to user.all once auto follow is completed
    @stylists = Stylist.all
  end

end
