class FashionboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    # team_count
    # binding.pry
    @stylists = current_member.team.access_codes.map(&:stylist_id).map {|id|Stylist.find(id)}
    team_count
  end


  private

    def team_count
      @team_count = @stylists.size
      # @team_count = current_member.team.count
    end


end
