class StylistsController < ApplicationController

  def index
    # @stylists = User.show_only_stylist
    @stylists = User.stylists
    @members = User.members
  end

end
