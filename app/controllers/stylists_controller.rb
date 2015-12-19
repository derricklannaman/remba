class StylistsController < ApplicationController

  def index
    @stylists = User.stylists
    @members = User.members
  end

end
